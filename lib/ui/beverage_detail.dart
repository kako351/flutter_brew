import 'package:flutter/material.dart';
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
            return Center(
              child: Text('Detail: ${detail.description}')
            );
          }
        )
    );
  }
}
