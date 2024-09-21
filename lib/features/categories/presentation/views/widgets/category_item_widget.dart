import 'package:flutter/material.dart';
import 'package:shopapp/features/categories/data/models/categories_model/datum.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    this.categoriesModel,
  });
  final Datum? categoriesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image(
            image: NetworkImage(categoriesModel?.image.toString() ?? ''),
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 20),
          Text(
            categoriesModel?.name.toString() ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
