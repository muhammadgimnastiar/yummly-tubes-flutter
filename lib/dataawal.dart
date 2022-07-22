class Recipeawal {
  String title;
  String description;
  String image;
  int calories;
  int carbo;
  int protein;
  String link;

  Recipeawal(this.title, this.description, this.image, this.calories,
      this.carbo, this.protein,
      {this.link = "https://youtu.be/bLDqaSQAcaQ"});
}

List<Recipeawal> getRecipeawal() {
  return <Recipeawal>[
    Recipeawal("Chicken Fried Rice", "So irresistibly delicious",
        "assets/images/chicken_fried_rice.png", 250, 35, 6,
        link: "https://youtu.be/bLDqaSQAcaQ"),
    Recipeawal(
        "Pasta Bolognese",
        "True Italian classic with a meaty, chilli sauce",
        "assets/images/pasta_bolognes.png",
        200,
        45,
        10,
        link: "https://youtu.be/OieOiiHCa-w"),
    Recipeawal("Garlic Potatoes", "Crispy Garlic Roasted Potatoes",
        "assets/images/filete_con_papas_cambray.png", 150, 30, 8,
        link: "https://youtu.be/9nOxoC0paPM"),
    Recipeawal("Asparagus", "White Onion, Fennel, and watercress Salad",
        "assets/images/pasta_bolognes.png", 190, 35, 12,
        link: "https://youtu.be/9nOxoC0paPM"),
    Recipeawal("Filet Mignon", "Bacon-Wrapped Filet Mignon",
        "assets/images/steak_bacon.png", 250, 55, 20,
        link: "https://youtu.be/2ceVrEHytQM"),
  ];
}
