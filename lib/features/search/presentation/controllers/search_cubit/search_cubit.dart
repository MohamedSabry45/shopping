import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/core/constants/end_point_const.dart';
import 'package:shopapp/core/services/api_services.dart';
import 'package:shopapp/features/search/data/models/search_model/search_model.dart';

part 'search_state.dart';

class SearchItemCubit extends Cubit<SearchState> {
  SearchItemCubit() : super(SearchInitial());

  static SearchItemCubit get(context) => BlocProvider.of(context);
  void search(String text) async {
    try {
      emit(SearchLoading());
      var response = await ApiServices.postData(
          token: getToken,
          url: searchEndPoint,
          data: {
            "text": text,
          });
      SearchModel searchModel = SearchModel.fromJson(response.data);
      emit(SearchSuccess(searchModel: searchModel));
    } catch (e) {
      log(e.toString());
      emit(SearchFailure(e.toString()));
    }
  }
  onChange(Change<SearchState> change) {
    log(change.currentState.toString());
    super.onChange(change);
  }
}
