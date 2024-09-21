import 'package:flutter/material.dart';
import 'package:shopapp/features/products/presentation/views/widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductViewBody'),
      ),
      body: const ProductViewBody(),
    );
  }
}
