part of 'home_shop_cubit.dart';

@immutable
sealed class HomeShopState {}

final class HomeShopInitial extends HomeShopState {}

final class HomeShopChangeBottomNavState extends HomeShopState {}
