
import 'package:flutter/material.dart';
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/ui/designsystem/color.dart';
import 'package:flutter_brew/ui/search_result_view_model.dart';
import 'package:flutter_brew/ui/viewstate/search_result_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultPage extends ConsumerStatefulWidget {
  const SearchResultPage({required this.words, super.key});

  final String words;

  @override
  SearchResultPageState createState() => SearchResultPageState();
}

class SearchResultPageState extends ConsumerState<SearchResultPage> {
  @override
  void initState() {
    super.initState();
    ref.read(searchResultViewModelProvider(widget.words));
  }

  @override
  Widget build(BuildContext context) {
    return SearchResult(words: widget.words);
  }
}

class SearchResult extends ConsumerWidget {
  const SearchResult({required this.words, super.key});

  final String words;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(searchResultViewModelProvider(words));

    return Scaffold(
      appBar: AppBar(
        title: Text(words),
      ),
      body: data.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (o, s) => const Center(child: Text('データの読み込み失敗')),
        data: (viewState) {
          if (viewState is SuccessSearchResultViewState) {
            return ListView.builder(
              itemCount: viewState.beverages.length,
              itemBuilder: (context, index) {
                return SearchResultItem(
                  beverage: viewState.beverages[index],
                  onTap: () {

                  }
                );
              },
            );
          }
        },
      ),
    );
  }
}

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({required this.beverage, required this.onTap, super.key});

  final Beverage beverage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 132.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
