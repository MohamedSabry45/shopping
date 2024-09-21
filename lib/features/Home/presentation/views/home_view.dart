import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/constants/end_point_const.dart';
import 'package:shopapp/core/services/cache_helper_services.dart';
import 'package:shopapp/features/Home/presentation/controllers/home_shop_cubit/home_shop_cubit.dart';
import 'package:shopapp/features/categories/presentation/controllers/categories_cubit/categories_cubit.dart';
import 'package:shopapp/features/favourites/presentation/controllers/change_favorites_cubit/favourite_cubit.dart';
import 'package:shopapp/features/favourites/presentation/controllers/get_favorites_cubit/get_favourites_cubit.dart';
import 'package:shopapp/features/products/presentation/controllers/cubit/product_cubit.dart';
import 'package:shopapp/features/search/presentation/views/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeShopCubit()),
        BlocProvider(create: (context) => ProductCubit()..gitHomeData()),
        BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => GetFavouritesCubit()..getFavorites()),
      ],
      child: Builder(builder: (context) {
        var cubit = HomeShopCubit.get(context);
        return BlocConsumer<HomeShopCubit, HomeShopState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Shop'),
                actions: [
                  IconButton(
                      onPressed: () {
                        log(CacheHelper.getData(key: token).toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchView()));
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (value) {
                  cubit.changeBottomNav(value);
                },
                showUnselectedLabels: true,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey[700],
                selectedIconTheme:
                    const IconThemeData(color: Colors.blue),
                unselectedIconTheme: const IconThemeData(color: Colors.grey),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'Categories'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favourites'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
            );
          },
        );
      }),
    );
  }
}
