import 'package:flutter/material.dart';

class ButtonsModel extends ChangeNotifier {


  List<Color> ingredients = [
    // Note in DART, list indices start at 0

    Colors.white, // (8UT23) [For Counting Purposes (Use Ctrl F) ('Beef', 0)
    Colors.white, // (8UT23) ('Chicken', 1)
    Colors.white, // (8UT23) ('Pork/Baboy', 2)
    Colors.white, // (8UT23) ('Carrot', 3)
    Colors.white, // (8UT23) ('Potato/Patatas', 4)
    Colors.white, // (8UT23) ('Tomato/Kamatis', 5)
    Colors.white, // (8UT23) ('Fish/Isda', 6)
    Colors.white, // (8UT23) ('Shrimp/Hipon', 7)
    Colors.white, // (8UT23) ('Crab/Alimango', 8)
    Colors.white, // (8UT23) ('Apple/Mansanas', 9)
    Colors.white, // (8UT23) ('Banana', 10)
    Colors.white, // (8UT23) ('Orange', 11)
    Colors.white, // (8UT23) ('Toyo', 12)
    Colors.white, // (8UT23) ('Sibuyas', 13)
    Colors.white, // (8UT23) ('Salt', 14)
    Colors.white, // (8UT23) ('Kanin', 15)
    Colors.white, // (8UT23) ('Green Papaya', 16)
    Colors.white, // (8UT23) ('Garlic/Bawang', 17)
    Colors.white, // (8UT23) ('Ginger/Luya', 18)
    Colors.white, // (8UT23) ('Fish Sauce/Patis', 19)
    Colors.white, // (8UT23) ('Hot Pepper Leaves', 20)
    Colors.white, // (8UT23) ('Ground Black Pepper', 21)
  ];

  void updateIngredientsButton(int index, Color color) {
    ingredients[index] = color;
    notifyListeners();
  }

  List<Color> filters = [
    // Note in DART, list indices start at 0

    Colors.white, // (8UT24) [For Counting Purposes (Use Ctrl F) ('Breakfast', 0)
    Colors.white, // (8UT24) ('Lunch', 1)
    Colors.white, // (8UT24) ('Dinner', 2)
    Colors.white, // (8UT24) ('Desserts', 3)
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