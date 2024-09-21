import 'package:flutter/material.dart';
import 'package:shopapp/features/favourites/data/models/get_favourites_model/product.dart';

class CustomStackFavoriteImage extends StatelessWidget {
  const CustomStackFavoriteImage({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image.network(
            product?.image ??
                'https://student.valuxapps.com/storage/uploads/banners/1689106848R4Nxl.photo_2023-07-11_23-08-19.png',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
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
      ),
    );
  }
}
