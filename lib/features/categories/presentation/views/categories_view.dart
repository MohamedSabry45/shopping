import 'package:flutter/material.dart';
import 'package:shopapp/features/categories/presentation/views/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoriesViewBody'),
      ),
      body: const CategoriesViewBody(),
    );
  }
}
