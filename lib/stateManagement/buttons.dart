import 'package:flutter/material.dart';

class ButtonsModel extends ChangeNotifier {
  List<Color> ingredients = [
    // Note in DART, list indices start at 0

    Colors.white, // (8UT23) [For Counting Purposes (Use Ctrl F)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
  ];

  List<Color> filters = [
    // Note in DART, list indices start at 0

    Colors.white, // (8UT24) [For Counting Purposes (Use Ctrl F)
    Colors.white, // (8UT24)
    Colors.white, // (8UT24)
    Colors.white, // (8UT24)
  ];

  void updateFilters(int index, Color color) {
    filters[index] = color;
    notifyListeners();
  }

  void updateIngredientsButton(int index, Color color) {
    ingredients[index] = color;
    notifyListeners();
  }

  void clearFilters() {
    filters = List.filled(filters.length, Colors.white);
    notifyListeners();
  }

  void clearIngredients() {
    ingredients = List.filled(ingredients.length, Colors.white);
    notifyListeners();
}

// Add other methods to manipulate ingredients and filters as needed.
}