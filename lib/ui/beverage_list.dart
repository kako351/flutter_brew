
import 'package:flutter/material.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/ui/beverage_detail_args.dart';
import 'package:flutter_brew/ui/beverages_view_model.dart';
import 'package:flutter_brew/ui/viewstate/beverages_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widget_book;


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
          if (state is! SuccessBeveragesViewState) {
            return const Center(child: Text('予期せぬエラーが発生しました'));
          }

          final beverages = state.beverages;
          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: beverages.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    context.pushNamed(
                        'beverage_detail',
                        pathParameters: { 'id': '${beverages[index].id}' },
                        extra: BeverageDetailArgs.fromModel(beverages[index]),
                    );
                  },
                  child: BeverageCellWidget(beverage: beverages[index])
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Padding(padding: EdgeInsets.all(12)),
          );
        }
      ),
    );
  }
}


class BeverageCellWidget extends StatelessWidget {
  const BeverageCellWidget({required this.beverage, super.key});

  final Beverage beverage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: beverage.imageHeroTag,
          child: ClipOval(
            child: Image.network(
              beverage.image,
              key: Key(beverage.title),
              width: 100.0,
              height: 100.0,
              cacheWidth: 537,
              cacheHeight: 807,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
        ),
        Hero(
          tag: beverage.titleHeroTag,
          child: Text(beverage.title, style: Theme.of(context).textTheme.labelMedium
          ),
        ),
      ],
    );
  }
}

@widget_book.UseCase(
  name: 'BeverageCellWidget',
  type: BeverageCellWidget,
  path: '[widgets]/beverage_list',
)
BeverageCellWidget beverageList(BuildContext context) {
  final beverage = Beverage(
    id: 1,
    title: 'Beverage',
    image: 'https://fastly.picsum.photos/id/664/200/300.jpg?hmac=Ov1G0ZpIuC3e0t33HURn4DPJFK6o7bz602P6M-o_SDc',
    description: 'Description',
    ingredients: ['Ingredient 1', 'Ingredient 2'],
  );
  return BeverageCellWidget(beverage: beverage);
}