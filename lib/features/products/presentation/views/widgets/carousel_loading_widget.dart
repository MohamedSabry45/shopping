import 'package:flutter/material.dart';

class CarouselLoadingWidget extends StatelessWidget {
  const CarouselLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: MediaQuery.of(context).size.height * .35,
      width: double.infinity,
    );
  }
}
