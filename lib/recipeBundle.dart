import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, chefs, recipes;
  final String title, description, imageSrc;
  final Color color;

  RecipeBundle(
      {required this.id,
      required this.chefs,
      required this.recipes,
      required this.title,
      required this.description,
      required this.imageSrc,
      required this.color});
}

List<RecipeBundle> recipeBundles = [
  RecipeBundle(
      id: 1,
      chefs: 16,
      recipes: 95,
      title: "Cook Something New Everyday",
      description: "New and tasty recipes every minute",
      imageSrc: "assets/images/menu1.png",
      color: Colors.red),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: "Best Brakfest in 2020",
    description: "Cook recipes for special occasions",
    imageSrc: "assets/images/menu2.png",
    color: Colors.yellow,
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Favourites Menu Food Court",
    description: "What's your favorite food dish make it now",
    imageSrc: "assets/images/menu3.png",
    color: Colors.green,
  ),
  RecipeBundle(
    id: 4,
    chefs: 15,
    recipes: 30,
    title: "Takjil Chocolate Kekinian",
    description: "Lets make this! sure, you wont disappoint",
    imageSrc: "assets/images/menu5.png",
    color: Colors.blue,
  ),
];
