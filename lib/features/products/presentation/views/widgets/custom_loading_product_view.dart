import 'package:flutter/material.dart';
import 'package:shopapp/core/widgets/custom_fading_widget.dart';
import 'package:shopapp/features/products/presentation/views/widgets/carousel_loading_widget.dart';
import 'package:shopapp/features/products/presentation/views/widgets/loading_list_view_horizontal.dart';

class CustomLoadingProductView extends StatelessWidget {
  const CustomLoadingProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CarouselLoadingWidget(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Categories", style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 10),
          const LoadingListViewHorizontal(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("New Products", style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 10),
          ...List.generate(
            10,
            (index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        height: 200,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        height: 200,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
