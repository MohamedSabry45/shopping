import 'package:flutter/material.dart';
import 'package:shopapp/features/categories/data/models/categories_model/datum.dart';
import 'package:shopapp/features/categories/presentation/views/widgets/category_item_widget.dart';

class CategoriesViewBodyListView extends StatelessWidget {
  const CategoriesViewBodyListView({
    super.key,
    this.data,
    required this.itemCount,
  });
  final List<Datum>? data;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CategoryItemWidget(
              categoriesModel: data?[index],
            ),
        separatorBuilder: (context, index) => const Divider(
              height: 40,
              endIndent: 20,
              indent: 20,
            ),
        itemCount: itemCount);
  }
}
