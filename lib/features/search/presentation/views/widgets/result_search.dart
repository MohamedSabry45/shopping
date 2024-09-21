import 'package:flutter/material.dart';
import 'package:shopapp/features/search/data/models/search_model/datum.dart';
import 'package:shopapp/features/search/presentation/views/widgets/item_result_search.dart';

class ResultSearch extends StatelessWidget {
  const ResultSearch({super.key, this.data});
  final List<Datum>? data;
  @override
  Widget build(BuildContext context) {
    return data == null
        ? const SizedBox()
        : ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return ItemResultSearch(item: data![index]);
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data!.length);
  }
}
