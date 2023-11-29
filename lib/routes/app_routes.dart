import 'package:flutter/material.dart';

// Screens
import 'package:kusina_app_v3/screens/ingredients_page_screen.dart';
import 'package:kusina_app_v3/screens/home_page_screen.dart';
import 'package:kusina_app_v3/screens/results_page_screen.dart';
import 'package:kusina_app_v3/screens/missing_ingredients_page.dart';
import 'package:kusina_app_v3/screens/shopping_list_screen.dart';

// Recipe Instruction Pages
import 'package:kusina_app_v3/recipes/tinola.dart';
import 'package:kusina_app_v3/recipes/tapsilog.dart';


class AppRoutes {
  /*
  The static constants in the AppRoutes class are not related
  to the file path of the Dart files. They are just identifiers
  for the routes used in navigation within the app.
   */

  // static const String recipeInstructionsPageScreen = '/recipe_instructions_page_screen';
   static const String homePage = '/home_page_screen';
   static const String missingIngredients = '/missing_ingredients_page';
  // static const String homePageContainerScreen = '/home_page_container_screen';
  static const String ingredientsPageScreen = '/ingredients_page_screen';
  // static const String listPageScreen = '/list_page_screen';
  // static const String recipesPageScreen = '/recipes_page_screen';
  static const String shoppingListScreen= '/shopping_list_screen';
  static const String resultsPageScreen = '/results_page_screen';
  // static const String favoritesPageEmptyScreen = '/favorites_page_empty_screen';
  // static const String favoritesPageScreen = '/favorites_page_screen';
  // static const String appNavigationScreen = '/app_navigation_screen';

   // Recipe Instruction Pages
   static const String tinola = '/tinola';
   static const String tapsilog= '/tapsilog';

  static Map<String, WidgetBuilder> routes = {

    // Screens
    // recipeInstructionsPageScreen: (context) => RecipeInstructionsPageScreen(),
    // homePageContainerScreen: (context) => HomePageContainerScreen(),
    ingredientsPageScreen: (context) => IngredientsPageScreen(),
    homePage: (context) => HomePageScreen(),
    missingIngredients: (context) => MissingIngredientsPage(),
    // listPageScreen: (context) => ListPageScreen(),
    // recipesPageScreen: (context) => RecipesPageScreen(),
    // shoppingListPageEmptyScreen: (context) => ShoppingListPageEmptyScreen(),
    resultsPageScreen: (context) => ResultsPageScreen(),
    shoppingListScreen: (context) => ShoppingList(),
    // favoritesPageEmptyScreen: (context) => FavoritesPageEmptyScreen(),
    // favoritesPageScreen: (context) => FavoritesPageScreen(),
    // appNavigationScreen: (context) => AppNavigationScreen()

    // Recipe Instruction Pages
    tinola: (context) => Tinola(),
    tapsilog: (context) => Tapsilog(),

  };
}
