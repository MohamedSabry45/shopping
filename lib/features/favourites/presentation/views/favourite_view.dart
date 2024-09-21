import 'package:flutter/material.dart';
import 'package:shopapp/features/favourites/presentation/views/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoriteViewBody'),
      ),
      body: const FavoriteViewBody(),
    );
  }
}
