import 'package:flutter/material.dart';
import 'package:shopapp/features/Home/data/models/home_model/home_model.dart';
import 'package:shopapp/features/products/presentation/views/widgets/build_product_grid_view.dart';
import 'package:shopapp/features/products/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:shopapp/features/products/presentation/views/widgets/custom_categories_home_list_view_separated.dart';

class ProductModalProgressHUD extends StatelessWidget {
  const ProductModalProgressHUD({super.key, this.model});
  final HomeModel? model;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomCarouselSlider(model: model),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Categories",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 10),
                    const CustomCategoriesHomeListViewSeparated(),
                    const SizedBox(height: 20),
                    Text("New Products",
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return BuildProductGridView(
                product: model?.data?.products?[index],
              );
            },
            childCount: model?.data?.products?.length ?? 0,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.59,
          ),
        ),
      ],
    );
  }
}
