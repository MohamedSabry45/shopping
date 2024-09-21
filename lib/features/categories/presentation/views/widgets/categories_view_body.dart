import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/categories/presentation/controllers/categories_cubit/categories_cubit.dart';
import 'package:shopapp/features/categories/presentation/views/widgets/categories_view_body_list_view.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return CategoriesViewBodyListView(
            itemCount: state.categoriesModel.data?.data?.length ?? 0,
            data: state.categoriesModel.data?.data,
          );
        } else if (state is CategoriesFailure) {
          return Center(child: Text(state.message));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
