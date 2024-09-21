import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/features/categories/presentation/views/widgets/categories_view_body.dart';
import 'package:shopapp/features/favourites/presentation/views/widgets/favorite_view_body.dart';
import 'package:shopapp/features/products/presentation/views/widgets/product_view_body.dart';
import 'package:shopapp/features/settings/presentation/views/widgets/settings_view_body.dart';

part 'home_shop_state.dart';

class HomeShopCubit extends Cubit<HomeShopState> {
  HomeShopCubit() : super(HomeShopInitial());

  static HomeShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const ProductViewBody(),
    const CategoriesViewBody(),
    const FavoriteViewBody(),
    const SettingsViewBody(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeShopChangeBottomNavState());
  }

  @override
  void onChange(Change<HomeShopState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
