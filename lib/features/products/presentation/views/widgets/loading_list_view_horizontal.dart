import 'package:flutter/material.dart';

class LoadingListViewHorizontal extends StatelessWidget {
  const LoadingListViewHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey,
              width: 80,
              height: 80,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: 7),
    );
  }
}
