import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/widgets/custom_fading_widget.dart';
import 'package:shopapp/features/categories/presentation/controllers/categories_cubit/categories_cubit.dart';
import 'package:shopapp/features/products/presentation/views/widgets/custom_stack_categories.dart';
import 'package:shopapp/features/products/presentation/views/widgets/loading_list_view_horizontal.dart';

class CustomCategoriesHomeListViewSeparated extends StatelessWidget {
  const CustomCategoriesHomeListViewSeparated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return SizedBox(
            height: 80,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomStackCategories(
                      categoriesModel:
                          state.categoriesModel.data?.data?[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.categoriesModel.data?.data?.length ?? 0),
          );
        } else if (state is CategoriesFailure) {
          return Center(child: Text(state.message));
        }
        return const CustomFadingWidget(
          child: LoadingListViewHorizontal(),
        );
      },
    );
  }
}
