import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../RecipeModel.dart';

class FavoriteService extends ChangeNotifier {
  int? selectedIndex;

  List<Map<String, dynamic>> listInformation = [
    {
      'nama resep': 'Gordon Ramsays butter chicken',
      'skills': 'Medium',
      'preparation time': '20 Mins (Plus 3 Hrs Chilling Time)',
      'cooking time': '30 Mins',
      'total time': '50 Mins',
      'cost range': 'Mid'
    },
  ];

  List<Map<String, dynamic>> demoRecipe = [];

  void deleteInformation(int index) {
    listInformation.removeAt(index);
    notifyListeners();
  }

  addToFavorite(String title, String writer, String description,
      int cookingTime, int servings, String imgPath, List<String> ingredients) {
    demoRecipe.add({
      "title": title,
      "writer": writer,
      "description": description,
      "cookingTime": cookingTime,
      "servings": servings,
      "imgPath": imgPath,
      "ingredients": ingredients,
    });
    print(demoRecipe.length);
    notifyListeners();
  }

  deleteToFavorite(String imgPath) {
    if (getIndex(imgPath) != -1) {
      demoRecipe.removeAt(getIndex(imgPath));
    }

    print(demoRecipe.length);
    notifyListeners();
  }

  int getIndex(String imgPath) {
    for (int i = 0; i < demoRecipe.length; i++) {
      if (demoRecipe[i]['imgPath'] == imgPath) {
        return i;
      }
    }
    return -1;
  }

  void createInformation() {
    listInformation.add(
      {
        'nama resep': '',
        'skills': '',
        'preparation time': '',
        'cooking time': '',
        'total time': '',
        'cost range': ''
      },
    );
    notifyListeners();
  }
}
