part of 'get_favourites_cubit.dart';

@immutable
sealed class GetFavouritesState {}

final class GetFavouritesInitial extends GetFavouritesState {}

final class FavoritesGetLoading extends GetFavouritesState {}

final class FavoritesGetSuccess extends GetFavouritesState {
  final GetFavoritesModel getFavoritesModel;

  FavoritesGetSuccess({required this.getFavoritesModel});
}

final class FavoritesGetFailure extends GetFavouritesState {
  final String errMessage;

  FavoritesGetFailure(this.errMessage);
}
