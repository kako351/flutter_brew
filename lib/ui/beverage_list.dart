
import 'package:flutter/material.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/ui/beverage_detail_args.dart';
import 'package:flutter_brew/ui/beverages_view_model.dart';
import 'package:flutter_brew/ui/designsystem/color.dart';
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

  final int _crossAxisCount = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(beveragesViewModelProvider);
    final notifier = ref.read(beveragesViewModelProvider.notifier);

    final double itemWidth = (MediaQuery.of(context).size.width / _crossAxisCount) - 16.0;
    final double itemHeight = itemWidth * 0.9;

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
          return Column(
            children: [
              CategoryUI(
                  selectedType: state.type,
                  onTapCallback: (type) => {
                    notifier.updateSelectedType(type)
                  }
                ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: _crossAxisCount,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: (itemWidth / itemHeight),
                  children: List.generate(
                    beverages.length, (index) {
                      return BeverageCellWidget(beverage: beverages[index], onTap: () {
                        context.pushNamed(
                          'beverage_detail',
                          pathParameters: { 'id': '${beverages[index].id}' },
                          extra: BeverageDetailArgs.fromModel(beverages[index]),
                        );
                      });
                    }
                  ),
                )
              ),
            ]
          );
        }
      ),
    );
  }
}


class BeverageCellWidget extends StatelessWidget {
  const BeverageCellWidget({required this.beverage, required this.onTap, super.key});

  final Beverage beverage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: beverage.imageHeroTag,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    beverage.image,
                    key: Key(beverage.title),
                    width: MediaQuery.of(context).size.width,
                    cacheWidth: 537,
                    cacheHeight: 807,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: beverage.titleHeroTag,
                      child: Text(beverage.title, style: Theme.of(context).textTheme.labelLarge
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                    ),
                    Text(
                      beverage.ingredients.join(', '),
                      style: Theme.of(context).textTheme.labelSmall?.merge(TextStyle(color: BrewColor.lightGrey)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryUI extends StatelessWidget {
  const CategoryUI({required this.selectedType, required this.onTapCallback, super.key});

  final BeverageType selectedType;
  final Function(BeverageType) onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(
                  context, BeverageType.all, selectedType == BeverageType.all, () { onTapCallback(BeverageType.all); }),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  context, BeverageType.hot, selectedType == BeverageType.hot, () { onTapCallback(BeverageType.hot); }),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  context, BeverageType.iced, selectedType == BeverageType.iced, () { onTapCallback(BeverageType.iced); }),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

Widget getButtonUI(BuildContext context, BeverageType type, bool isSelected, VoidCallback onTap) {
  String txt = type.displayValue;

  return Expanded(
    child: Container(
      decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          border: Border.all(color: Theme.of(context).colorScheme.primary)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white24,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 12, bottom: 12, left: 18, right: 18),
            child: Center(
              child: Text(
                txt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 0.27,
                  color: isSelected
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

void onCategorySelected(WidgetRef ref, BeverageType type) {
  var notifier = ref.read(beveragesViewModelProvider.notifier);
  notifier.updateSelectedType(type);
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
    type: BeverageType.hot,
  );
  return BeverageCellWidget(beverage: beverage, onTap: () {});
}