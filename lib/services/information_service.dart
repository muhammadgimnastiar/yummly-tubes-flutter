import 'package:flutter/material.dart';

class InformationService extends ChangeNotifier {
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
    {
      'nama resep': 'Cajun Butter Steak Bites',
      'skills': 'Hard',
      'preparation time': '15 Mins',
      'cooking time': '1 Hours',
      'total time': '1/5 Hours',
      'cost range': 'Expensive'
    },
    {
      'nama resep': 'Malaysian Vegetable Curry',
      'skills': 'Easy',
      'preparation time': '10 Mins',
      'cooking time': '30 Mins',
      'total time': '1 Hours',
      'cost range': 'Mid'
    },
    {
      'nama resep': 'Garlic Bread',
      'skills': 'Medium',
      'preparation time': '20 Mins (Plus 2 Hrs Chilling Time)',
      'cooking time': '50 Mins',
      'total time': '2 Hours',
      'cost range': 'Expensive'
    },
  ];

  void updateInformation(
      int index,
      String nama_resep,
      String skills,
      String preparation_time,
      String cooking_time,
      String total_time,
      String cost_range) {
    listInformation[index]['nama resep'] = nama_resep;
    listInformation[index]['skills'] = skills;
    listInformation[index]['preparation time'] = preparation_time;
    listInformation[index]['cooking time'] = cooking_time;
    listInformation[index]['total time'] = total_time;
    listInformation[index]['cost range'] = cost_range;
    notifyListeners();
  }

  void deleteInformation(int index) {
    listInformation.removeAt(index);
    notifyListeners();
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
