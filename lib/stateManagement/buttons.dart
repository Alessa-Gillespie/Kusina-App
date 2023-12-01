import 'package:flutter/material.dart';

class ButtonsModel extends ChangeNotifier {


  List<Color> ingredients = [
    // Note in DART, list indices start at 0

    /*
    Chicken,
    Rice,
    Green Papaya,
    Garlic,
    Onion,
    Ginger,
    Fish Sauce,
    Hot Pepper Leaves,
    Black Pepper
    */


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
    Colors.white, // (8UT23) ('Egg/Itlog', 22)
    Colors.white, // (8UT23) ('Knorr Liquid Seasoning', 23)
    Colors.white, // (8UT23) ('Pineapple Juice', 24)
    Colors.white, // (8UT23) ('Brown Sugar', 25)
    Colors.white, // (8UT23) ('White Pepper / Pamintang Puti', 26)
    Colors.white, // (8UT23) ('Cassava / Kamoteng Kahoy', 27)
    Colors.white, // (8UT23) ('Coconut Milk / Gata ng Niyog', 28)
    Colors.white, // (8UT23) ('Evaporated Milk', 29)
    Colors.white, // (8UT23) ('Butter', 30)
    Colors.white, // (8UT23) ('Cheddar Cheese', 31)
    Colors.white, // (8UT23) ('Condensed Milk', 32)
    Colors.white, // (8UT23) ('White Sugar', 33)
    Colors.white, // (8UT23) ('Flour/Harina', 34)
    Colors.white, // (8UT23) ('Pig Liver/ Atay ng Baboy', 35)
    Colors.white, // (8UT23) ('Lemon', 36)
    Colors.white, // (8UT23) ('Tomato Sauce', 37)
    Colors.white, // (8UT23) ('Hotdog', 38)
    Colors.white, // (8UT23) ('Dried Bay Leaves', 39)
    Colors.white, // (8UT23) ('Pepper', 40)
    Colors.white, // (8UT23) ('Cabbage/Repolyo', 41)
    Colors.white, // (8UT23) ('Bok Choy', 42)
    Colors.white, // (8UT23) ('Corn/Mais', 43)
    Colors.white, // (8UT23) ('Black Pepper', 44)
    Colors.white, // (8UT23) ('Green Onions', 45)
    Colors.white, // (8UT23) ('Lumpia Wrapper', 46)
    Colors.white, // (8UT23) ('Garlic Powder', 47)
    Colors.white, // (8UT23) ('Parsley', 48)
    Colors.white, // (8UT23) ('Sesame Oil', 49)
    Colors.white, // (8UT23) ('Cocoa Powder', 50)
    Colors.white, // (8UT23) ('Kaning Malagkit', 51)
    Colors.white, // (8UT23) ('Water/Tubig', 52)
    Colors.white, // (8UT23) ('Bangus', 53)
    Colors.white, // (8UT23) ('Vinegar/Suka', 54)
    Colors.white, // (8UT23) ('Cayenne Pepper Powder', 55)
    Colors.white, // (8UT23) ('Sea Salt', 56)
    Colors.white, // (8UT23) ('Tuyo Salted Dried Fish', 57)
    Colors.white, // (8UT23) ('Red Onion', 58)
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



  Map<String, bool> _heartIcons = {};

  bool isHeartIconPressed(String id) => _heartIcons[id] ?? false;

  void toggleHeartIcon(String id) {
    _heartIcons[id] = !isHeartIconPressed(id);
    notifyListeners();
  }

  bool isAnyHeartIconPressed() {
    return _heartIcons.values.any((isPressed) => isPressed);
  }


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

  bool isRecipeBankEmpty() {
    return recipeBank.isEmpty;
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