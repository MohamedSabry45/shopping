import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/search/presentation/controllers/search_cubit/search_cubit.dart';
import 'package:shopapp/features/search/presentation/views/widgets/result_search.dart';

class ResultSearchBlocBuilder extends StatelessWidget {
  const ResultSearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchItemCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccess) {
        return state.searchModel.data!.data!.isEmpty
            ? const SizedBox()
            : ResultSearch(data: state.searchModel.data!.data!);
      }
      if (state is SearchFailure) {
        return Center(child: Text(state.errMessage));
      }
      if (state is SearchLoading) {
        return const LinearProgressIndicator();
      }
      return const SizedBox();
    });
  }
}
