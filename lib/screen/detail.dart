import 'package:flutter/material.dart';
import 'package:yummly_ui/dataawal.dart';

class DetailHome extends StatelessWidget {
  final Recipeawal recipe;

  DetailHome({required this.recipe});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.height,
      child: Stack(
        children: [
          Container(
            height: 290,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(recipe.image))),
          )
        ],
      ),
    ));
  }
}
