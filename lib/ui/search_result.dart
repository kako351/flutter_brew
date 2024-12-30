
import 'package:flutter/material.dart';
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
                return ListTile(
                  title: Text(viewState.beverages[index].title),
                  subtitle: Text(viewState.beverages[index].description),
                );
              },
            );
          }
        },
      ),
    );
  }
}
