import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/core/constants/end_point_const.dart';
import 'package:shopapp/core/services/api_services.dart';
import 'package:shopapp/features/favourites/data/models/get_favourites_model/get_favourites_model.dart';

part 'get_favourites_state.dart';

class GetFavouritesCubit extends Cubit<GetFavouritesState> {
  GetFavouritesCubit() : super(GetFavouritesInitial());
  static GetFavouritesCubit get(context) => BlocProvider.of(context);
  void getFavorites() async {
    emit(FavoritesGetLoading());
    try {
      var response =
          await ApiServices.getData(url: favoritesEndPoint, token: getToken);
      GetFavoritesModel? getFavoritesModel =
          GetFavoritesModel.fromJson(response.data);
      log(response.data.toString());
      if (!getFavoritesModel.status!) {
        throw Exception(getFavoritesModel.message!);
      }
      emit(FavoritesGetSuccess(getFavoritesModel: getFavoritesModel));
    } on Exception catch (e) {
      emit(FavoritesGetFailure(e.toString()));
    } catch (e) {
      emit(FavoritesGetFailure(e.toString()));
    }
  }

  @override
  void onChange(Change<GetFavouritesState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
