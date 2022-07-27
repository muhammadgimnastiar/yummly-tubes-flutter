class Recipe {
  String title;
  String description;
  String image;
  int calories;
  int carbo;
  int protein;
  String link;

  Recipe(this.title, this.description, this.image, this.calories, this.carbo,
      this.protein,
      {this.link = "https://youtu.be/bLDqaSQAcaQ"});
}

List<Recipe> getRecipe() {
  return <Recipe>[
    Recipe("Chicken Fried Rice", "So irresistibly delicious",
        "assets/images/chicken_fried_rice.png", 250, 35, 6,
        link: "https://youtu.be/bLDqaSQAcaQ"),
    Recipe("Pasta Bolognese", "True Italian classic with a meaty, chilli sauce",
        "assets/images/pasta_bolognes.png", 200, 45, 10,
        link: "https://youtu.be/OieOiiHCa-w"),
    Recipe("Garlic Potatoes", "Crispy Garlic Roasted Potatoes",
        "assets/images/filete_con_papas_cambray.png", 150, 30, 8,
        link: "https://youtu.be/9nOxoC0paPM"),
    Recipe("Asparagus", "White Onion, Fennel, and watercress Salad",
        "assets/images/asparagus.png", 190, 35, 12,
        link: "https://youtu.be/9nOxoC0paPM"),
    Recipe("Filet Mignon", "Bacon-Wrapped Filet Mignon",
        "assets/images/steak_bacon.png", 250, 55, 20,
        link: "https://youtu.be/2ceVrEHytQM"),
  ];
}
