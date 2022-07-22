import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recipeawal {
  String title;
  String description;
  Widget text;
  String image;
  int calories;
  int carbo;
  int protein;
  String link;

  Recipeawal(this.title, this.description, this.text, this.image, this.calories,
      this.carbo, this.protein,
      {this.link = "https://youtu.be/bLDqaSQAcaQ"});
}

List<Recipeawal> getRecipeawal() {
  return <Recipeawal>[
    Recipeawal(
        "Chicken Fried Rice",
        "So irresistibly delicious",
        Text(
          " is simply dummy text of the printing and typesetting"
          " industry. Lorem Ipsum has been the industry's standard dummy "
          "text ever since the 1500s, when an unknown printer took a galley"
          " of type and scrambled it to make a type specimen book. It has ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        "assets/images/chicken_fried_rice.png",
        250,
        35,
        6,
        link: "https://youtu.be/bLDqaSQAcaQ"),
    Recipeawal(
        "Pasta Bolognese",
        "True Italian classic ",
        Text(
          " is simply dummy text of the printing and typesetting"
          " industry. Lorem Ipsum has been the industry's standard dummy "
          "text ever since the 1500s, when an unknown printer took a galley"
          " of type and scrambled it to make a type specimen book. It has ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        "assets/images/pasta_bolognes.png",
        200,
        45,
        10,
        link: "https://youtu.be/OieOiiHCa-w"),
    Recipeawal(
        "Garlic Potatoes",
        "Crispy Garlic Roasted Potatoes",
        Text(
          " is simply dummy text of the printing and typesetting"
          " industry. Lorem Ipsum has been the industry's standard dummy "
          "text ever since the 1500s, when an unknown printer took a galley"
          " of type and scrambled it to make a type specimen book. It has ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        "assets/images/filete_con_papas_cambray.png",
        150,
        30,
        8,
        link: "https://youtu.be/9nOxoC0paPM"),
    Recipeawal(
        "Asparagus",
        "White Onion and watercress Salad",
        Text(
          " is simply dummy text of the printing and typesetting"
          " industry. Lorem Ipsum has been the industry's standard dummy "
          "text ever since the 1500s, when an unknown printer took a galley"
          " of type and scrambled it to make a type specimen book. It has ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        "assets/images/pasta_bolognes.png",
        190,
        35,
        12,
        link: "https://youtu.be/9nOxoC0paPM"),
    Recipeawal(
        "Filet Mignon",
        "Bacon-Wrapped Filet Mignon",
        Text(
          " is simply dummy text of the printing and typesetting"
          " industry. Lorem Ipsum has been the industry's standard dummy "
          "text ever since the 1500s, when an unknown printer took a galley"
          " of type and scrambled it to make a type specimen book. It has ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        "assets/images/steak_bacon.png",
        250,
        55,
        20,
        link: "https://youtu.be/2ceVrEHytQM"),
  ];
}
