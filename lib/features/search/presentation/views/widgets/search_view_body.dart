import 'package:flutter/material.dart';
import 'package:shopapp/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:shopapp/features/search/presentation/controllers/search_cubit/search_cubit.dart';
import 'package:shopapp/features/search/presentation/views/widgets/result_search_bloc_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: 'Search',
              prefixIcon: const Icon(Icons.search),
              onChanged: (text) {
                SearchItemCubit.get(context).search(text);
              },
              onFieldSubmitted: (value) {
                SearchItemCubit.get(context).search(value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
             const ResultSearchBlocBuilder()
          ],
        ),
      ),
    );
  }
}
