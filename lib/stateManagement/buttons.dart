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
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
    Colors.white, // (8UT23)
  ];

  void updateIngredientsButton(int index, Color color) {
    ingredients[index] = color;
    notifyListeners();
  }

  List<Color> filters = [
    // Note in DART, list indices start at 0

    Colors.white, // (8UT24) [For Counting Purposes (Use Ctrl F)
    Colors.white, // (8UT24)
    Colors.white, // (8UT24)
    Colors.white, // (8UT24)
  ];

  List<String> recipeBank = [];

  void addToRecipeBank(String item) {
    if (!recipeBank.contains(item)) {
      recipeBank.add(item);
      notifyListeners();
    }
  }

  bool isRecipeInBank(String recipe) {
    return recipeBank.contains(recipe);
  }

  void removeFromRecipeBank(String recipe) {
    recipeBank.remove(recipe);
    notifyListeners();
  }

  List<String> missingIngredientsBank = [];

  void addToMissingIngredientsBank(String item) {
    if (!missingIngredientsBank.contains(item)) {
      missingIngredientsBank.add(item);
      notifyListeners();
    }
  }

  bool isIngredientMissing(String ingredient) {
    return missingIngredientsBank.contains(ingredient);
  }

  void updateFilters(int index, Color color) {
    filters[index] = color;
    notifyListeners();
  }


  void removeFromMissingIngredientsBank(String ingredient) {
    missingIngredientsBank.remove(ingredient);
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

  String recipe = 'none';

  String getMyRecipe() {
    return recipe;
  }

  void setMyRecipe(String newRecipe) {
    recipe = newRecipe;
    notifyListeners();
  }

// Add other methods to manipulate ingredients and filters as needed.
}