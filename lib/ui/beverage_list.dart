
import 'package:flutter/material.dart';
import 'package:flutter_brew/ui/beverages_view_model.dart';
import 'package:flutter_brew/ui/viewstate/beverages_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class BeverageListPage extends ConsumerStatefulWidget {
  const BeverageListPage({super.key});

  @override
  BeverageListPageState createState() => BeverageListPageState();
}

class BeverageListPageState extends ConsumerState<BeverageListPage> {
  @override
  void initState() {
    super.initState();
    ref.read(beveragesViewModelProvider);
  }

  @override
  Widget build(BuildContext context) {
    return const BeverageList();
  }
}

class BeverageList extends ConsumerWidget {
  const BeverageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(beveragesViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Beverages'),
      ),
      body: data.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (o, s) => const Center(child: Text('データの読み込み失敗')),
        data: (state) {
          if (state is! SuccessBeveragesViewState) return null;

          final beverages = state.beverages;
          return ListView.builder(
            itemCount: beverages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${beverages[index]}'),
              );
            },
          );
        }
      ),
    );
  }
}