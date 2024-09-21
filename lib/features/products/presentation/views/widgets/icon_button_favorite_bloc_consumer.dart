import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/functions/show_tost.dart';
import 'package:shopapp/features/Home/data/models/home_model/product.dart';
import 'package:shopapp/features/favourites/data/models/get_favourites_model/datum.dart';
import 'package:shopapp/features/favourites/presentation/controllers/change_favorites_cubit/favourite_cubit.dart';
import 'package:shopapp/features/favourites/presentation/controllers/get_favorites_cubit/get_favourites_cubit.dart';
import 'package:shopapp/main.dart';

class IconButtonFavoriteBlocConsumer extends StatelessWidget {
  const IconButtonFavoriteBlocConsumer(
      {super.key, this.product, this.favoritesModel});
  final Product? product;
  final Datum? favoritesModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state is FavoritesChangeSuccess) {
          if (state.changeFavoritesModel.status!) {
            showTost(
                message: state.changeFavoritesModel.message.toString(),
                state: ToastStates.SUCCESS);
          }
          if (state is FavoritesChangeFailure) {
            showTost(
                message: state.changeFavoritesModel.message.toString(),
                state: ToastStates.ERROR);
          }
        }
      },
      builder: (context, state) {
        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            if (product == null) {
              FavoritesCubit.get(context)
                  .changeFavorites(favoritesModel?.product?.id ?? 0);
            } else if (favoritesModel == null) {
              FavoritesCubit.get(context).changeFavorites(product?.id ?? 0);
            }
            GetFavouritesCubit.get(context).getFavorites();
          },
          icon: CircleAvatar(
            radius: 15,
            backgroundColor: favorites[product == null
                        ? favoritesModel?.product?.id
                        : product!.id] ==
                    true
                ? Colors.blue
                : Colors.grey,
            child: const Icon(
              Icons.favorite_border,
              size: 14,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
