import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_brew/data/local/local_beverages.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/repository/beverage_repository.dart';
import 'package:flutter_brew/ui/route/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // di
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final dbPath = appDocumentDir.path;
  final isar = await Isar.open(
    [BeverageSchema],
    directory: dbPath,
    name: Isar.defaultName,
  );

  GetIt.I.registerLazySingleton(() => isar);
  GetIt.I.registerLazySingleton(() => LocalBeverages());
  GetIt.I.registerLazySingleton<BeverageRepository>(() => BeverageRepositoryImpl());
  await GetIt.I.allReady();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProviderScope(child: MyApp()), // Wrap your app
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Flutter Brew',
      debugShowCheckedModeBanner: !kReleaseMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
