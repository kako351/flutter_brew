
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/ui/beverage_detail_args.dart';
import 'package:flutter_brew/ui/favorite_beverage_view_model.dart';
import 'package:flutter_brew/ui/route/routes.dart';
import 'package:flutter_brew/ui/viewstate/favorite_beverage_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteBeveragePage extends ConsumerStatefulWidget {
  const FavoriteBeveragePage({super.key});

  @override
  FavoriteBeveragePageState createState() => FavoriteBeveragePageState();
}

class FavoriteBeveragePageState extends ConsumerState<FavoriteBeveragePage> {
  @override
  void initState() {
    super.initState();
    ref.read(favoriteBeverageViewModelProvider);
  }

  @override
  Widget build(BuildContext context) {
    return FavoriteBeverage();
  }
}

class FavoriteBeverage extends ConsumerWidget {
  const FavoriteBeverage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(favoriteBeverageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: data.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (o, s) => const Center(child: Text('データの読み込み失敗')),
        data: (viewState) {
          if (viewState is! SuccessFavoriteBeverageViewState) {
            return const Center(child: Text('予期せぬエラーが発生しました'));
          }

          final beverages = viewState.beverages;
          return ListView.builder(
            itemCount: beverages.length,
            itemBuilder: (context, index) {
              return FavoriteBeverageItem(
                beverage: beverages[index],
                onTap: () {
                  BeverageDetailPageRoute(id: beverages[index].beverageId, $extra: BeverageDetailArgs.fromModel(beverages[index])).push(context);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class FavoriteBeverageItem extends StatelessWidget {
  const FavoriteBeverageItem({required this.beverage, required this.onTap, super.key});

  final Beverage beverage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(beverage.title),
      subtitle: Text(beverage.title),
      onTap: onTap,
    );
  }
}
