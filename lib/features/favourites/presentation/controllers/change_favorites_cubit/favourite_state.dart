part of 'favourite_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesChangeLoading extends FavoritesState {}

final class FavoritesChangeSuccess extends FavoritesState {
  final ChangeFavoritesModel changeFavoritesModel;

  FavoritesChangeSuccess({required this.changeFavoritesModel});
}

final class FavoritesChangeFailure extends FavoritesState {
  final String errMessage;

  FavoritesChangeFailure(this.errMessage);
}
