import 'package:flutter/material.dart';
import 'package:yummly_ui/recipeBundleCard.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, int key) {
            return recipeBundleCard(
              index: key,
            );
          }),
    );
  }
}
