import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/search/presentation/controllers/search_cubit/search_cubit.dart';
import 'package:shopapp/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchItemCubit>(
      create: (context) => SearchItemCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: SearchViewBody(),
      ),
    );
  }
}
