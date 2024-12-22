import 'package:flutter/material.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/ui/beverage_detail_args.dart';
import 'package:flutter_brew/ui/designsystem/color.dart';
import 'package:flutter_brew/ui/designsystem/size.dart';
import 'package:flutter_brew/ui/designsystem/spacer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_brew/ui/beverage_detail_view_model.dart';

class BeverageDetailPage extends ConsumerStatefulWidget {
  const BeverageDetailPage({required this.id, this.args, super.key});

  final int id;
  final BeverageDetailArgs? args;

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
    return BeverageDetail(id: widget.id, args: widget.args);
  }
}

class BeverageDetail extends ConsumerWidget {
  const BeverageDetail({required this.id, this.args, super.key});

  final int id;
  final BeverageDetailArgs? args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(beverageDetailViewModelProvider(id));

    final args = this.args;

    return Scaffold(
        appBar: AppBar(
          title: Text(data.value?.title ?? args?.title ?? ''),
        ),
        body: data.when(
          loading: () {
            if(args != null) {
              return Column(
                children: [
                  _BeverageImage(image: args.image, imageHeroTag: args.imageHeroTag),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: SpacerDefinition.sizeM, right: SpacerDefinition.sizeM),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpacerS(),
                          _BeverageTitle(title: args.title, titleHeroTag: args.titleHeroTag),
                          SpacerL(),
                          Center(child: CircularProgressIndicator()),
                        ]
                    ),
                  )
                ]
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
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
              _BeverageImage(image: beverage.image, imageHeroTag: beverage.imageHeroTag),

              Container(
                margin: const EdgeInsets.only(left: SpacerDefinition.sizeM, right: SpacerDefinition.sizeM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpacerS(),
                    _BeverageTitle(title: beverage.title, titleHeroTag: beverage.titleHeroTag),
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

class _BeverageImage extends StatelessWidget {
  const _BeverageImage({required this.image, required this.imageHeroTag, super.key});

  final String image;
  final String imageHeroTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageHeroTag,
      child: Image.network(
        image,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        cacheWidth: 537,
        cacheHeight: 807,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Center(child: Icon(Icons.error));
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _BeverageTitle extends StatelessWidget {
  const _BeverageTitle({required this.title, required this.titleHeroTag, super.key});

  final String title;
  final String titleHeroTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: titleHeroTag,
      child: Text(title, style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
