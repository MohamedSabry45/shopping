import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/functions/show_tost.dart';
import 'package:shopapp/features/favourites/data/models/get_favourites_model/datum.dart';
import 'package:shopapp/features/favourites/presentation/controllers/get_favorites_cubit/get_favourites_cubit.dart';
import 'package:shopapp/features/favourites/presentation/views/widgets/custom_stack_favorite_image.dart';

import '../../../../products/presentation/views/widgets/icon_button_favorite_bloc_consumer.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFavouritesCubit, GetFavouritesState>(
      listener: (context, state) {
        if (state is FavoritesGetFailure) {
          showTost(message: state.errMessage, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        if (state is FavoritesGetSuccess) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return FavoritesItemWidget(
                  favoritesModel: state.getFavoritesModel.data!.data?[index],
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.getFavoritesModel.data!.data?.length ?? 0);
        } else if (state is FavoritesGetFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class FavoritesItemWidget extends StatelessWidget {
  const FavoritesItemWidget({
    super.key,
    this.favoritesModel,
  });
  final Datum? favoritesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomStackFavoriteImage(product: favoritesModel?.product),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      favoritesModel?.product?.name.toString() ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, height: 1.3),
                    ),
                    Row(
                      children: [
                        Text(
                          favoritesModel?.product?.price?.round().toString() ??
                              '',
                          style: const TextStyle(
                              fontSize: 12, color: Colors. blue),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          favoritesModel?.product?.oldPrice
                                  ?.round()
                                  .toString() ??
                              '',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                        const Spacer(),
                        IconButtonFavoriteBlocConsumer(
                          favoritesModel: favoritesModel,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
