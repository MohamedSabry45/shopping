import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/core/constants/end_point_const.dart';
import 'package:shopapp/core/services/api_services.dart';
import 'package:shopapp/features/favourites/data/models/change_favorites_model/change_favorites_model.dart';
import 'package:shopapp/main.dart';

part 'favourite_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  static FavoritesCubit get(context) => BlocProvider.of(context);
  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int productId) async {
    favorites[productId] = !favorites[productId]!;
    emit(FavoritesChangeLoading());
    try {
      var response = await ApiServices.postData(
          url: favoritesEndPoint,
          data: {
            'product_id': productId,
          },
          token: getToken);
      changeFavoritesModel = ChangeFavoritesModel.fromJson(response.data);
      if (!changeFavoritesModel!.status!) {
        favorites[productId] = !favorites[productId]!;
        emit(FavoritesChangeFailure(changeFavoritesModel!.message!));
      }
      emit(FavoritesChangeSuccess(changeFavoritesModel: changeFavoritesModel!));
    } catch (e) {
      favorites[productId] = !favorites[productId]!;
      emit(FavoritesChangeFailure(e.toString()));
    }
  }

  @override
  void onChange(Change<FavoritesState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
