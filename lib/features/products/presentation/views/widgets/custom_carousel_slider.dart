import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/features/Home/data/models/home_model/home_model.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key, this.model});
  final HomeModel? model;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(model?.data?.banners?.length ?? 0, (index) {
          return CachedNetworkImage(
            fit: BoxFit.fill,
            width: double.infinity,
            imageUrl: model?.data?.banners?[index].image.toString() ??
                'https://student.valuxapps.com/storage/uploads/banners/1689106848R4Nxl.photo_2023-07-11_23-08-19.png',
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        }),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.35,
          initialPage: 0,
          reverse: false,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ));
  }
}
