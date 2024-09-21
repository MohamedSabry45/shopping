import 'package:flutter/material.dart';
import 'package:shopapp/features/search/data/models/search_model/datum.dart';

class ItemResultSearch extends StatelessWidget {
  const ItemResultSearch({super.key, this.item});
  final Datum? item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Row(children: [
          SizedBox(
              width: 120,
              height: 120,
              child: Image.network(
                item?.image ??
                    'https://student.valuxapps.com/storage/uploads/banners/1689106848R4Nxl.photo_2023-07-11_23-08-19.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item?.name.toString() ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14, height: 1.3),
                        ),
                        Row(children: [
                          Text(
                            item?.price?.round().toString() ?? '',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.deepOrange),
                          ),
                        ])
                      ])))
        ]));
  }
}
