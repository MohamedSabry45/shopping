import 'package:flutter/material.dart';
import 'package:shopapp/features/Home/data/models/home_model/product.dart';
import 'package:shopapp/features/products/presentation/views/widgets/custom_stack_image_product.dart';
import 'package:shopapp/features/products/presentation/views/widgets/icon_button_favorite_bloc_consumer.dart';

class BuildProductGridView extends StatelessWidget {
  const BuildProductGridView({super.key, this.product});
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomStackImageProduct(product: product),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.name.toString() ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, height: 1.3),
                ),
                Row(
                  children: [
                    Text(
                      product?.price?.round().toString() ?? '',
                      style: const TextStyle(
                          fontSize: 12, color: Colors.blue),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      product?.oldPrice?.round().toString() ?? '',
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                    const Spacer(),
                    IconButtonFavoriteBlocConsumer(product: product),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
