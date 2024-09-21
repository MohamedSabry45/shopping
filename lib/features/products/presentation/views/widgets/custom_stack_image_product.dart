import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/features/Home/data/models/home_model/product.dart';

class CustomStackImageProduct extends StatelessWidget {
  const CustomStackImageProduct({super.key, this.product});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        CachedNetworkImage(
          imageUrl: product?.image.toString() ?? "",
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: double.infinity,
          height: 200,
        ),
        if (product?.discount != 0)
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: const Text(
              'DISCOUNT',
              style: TextStyle(color: Colors.white),
            ),
          ),
      ],
    );
  }
}
