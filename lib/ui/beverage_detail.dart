import 'package:flutter/material.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/ui/designsystem/color.dart';
import 'package:flutter_brew/ui/designsystem/size.dart';
import 'package:flutter_brew/ui/designsystem/spacer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_brew/ui/beverage_detail_view_model.dart';

class BeverageDetailPage extends ConsumerStatefulWidget {
  const BeverageDetailPage({required this.id, super.key});

  final int id;

  @override
  BeverageDetailPageState createState() => BeverageDetailPageState();
}

class BeverageDetailPageState extends ConsumerState<BeverageDetailPage> {
  @override
  void initState() {
    super.initState();
    ref.read(beverageDetailViewModelProvider(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BeverageDetail(id: widget.id);
  }
}

class BeverageDetail extends ConsumerWidget {
  const BeverageDetail({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(beverageDetailViewModelProvider(id));

    return Scaffold(
        appBar: AppBar(
          title: Text(data.value?.title ?? ''),
        ),
        body: data.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (o, s) => const Center(child: Text('データの読み込み失敗')),
          data: (state) {
            final detail = state;
            return _BeverageDetailContent(beverage: detail);
          }
        )
    );
  }
}

class _BeverageDetailContent extends StatelessWidget {
  const _BeverageDetailContent({required this.beverage});


  final Beverage beverage;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Image.network(
                beverage.image,
                key: Key(beverage.title),
                width: 500.0,
                height: 500.0,
                cacheWidth: 537,
                cacheHeight: 807,
                fit: BoxFit.cover,
              ),
              Container(
                margin: const EdgeInsets.only(left: SpacerDefinition.sizeM, right: SpacerDefinition.sizeM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpacerS(),
                    Text(beverage.title, style: Theme.of(context).textTheme.headlineLarge),
                    SpacerS(),
                    Text(beverage.description, style: Theme.of(context).textTheme.bodyLarge),
                    SpacerXL(),
                    Text(
                      'Ingredients',
                      style: Theme.of(context).textTheme.headlineMedium?.merge(
                        TextStyle(color: BrewColor.darkGrey)
                      ),
                    ),
                    SpacerS(),
                  ],
                ),
              )
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                  leading: Icon(Icons.circle, color: BrewColor.darkGrey, size: SizeDefinition.small),
                  horizontalTitleGap: 0,
                  title: Text(beverage.ingredients[index], style: Theme.of(context).textTheme.bodyLarge)
              );
            },
            childCount: beverage.ingredients.length,
          ),
        ),
      ],
    );
  }
}
