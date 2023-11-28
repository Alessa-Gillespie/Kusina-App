import 'package:flutter/material.dart';
import 'package:kusina_app_v3/screens/ingredients_page_screen.dart';
import 'package:kusina_app_v3/screens/home_page_screen.dart';
import 'package:kusina_app_v3/screens/results_page_screen.dart';

class AppRoutes {
  /*
  The static constants in the AppRoutes class are not related
  to the file path of the Dart files. They are just identifiers
  for the routes used in navigation within the app.
   */

  // static const String recipeInstructionsPageScreen = '/recipe_instructions_page_screen';

   static const String homePage = '/home_page_screen';

  // static const String homePageContainerScreen = '/home_page_container_screen';

  static const String ingredientsPageScreen = '/ingredients_page_screen';

  // static const String listPageScreen = '/list_page_screen';

  // static const String recipesPageScreen = '/recipes_page_screen';

  //static const String shoppingListPageEmptyScreen = '/shopping_list_page_empty_screen';

  static const String resultsPageScreen = '/results_page_screen';

  // static const String favoritesPageEmptyScreen = '/favorites_page_empty_screen';

  // static const String favoritesPageScreen = '/favorites_page_screen';

  // static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    // recipeInstructionsPageScreen: (context) => RecipeInstructionsPageScreen(),
    // homePageContainerScreen: (context) => HomePageContainerScreen(),
    ingredientsPageScreen: (context) => IngredientsPageScreen(),
    homePage: (context) => HomePageScreen(),
    // listPageScreen: (context) => ListPageScreen(),
    // recipesPageScreen: (context) => RecipesPageScreen(),
    // shoppingListPageEmptyScreen: (context) => ShoppingListPageEmptyScreen(),
    resultsPageScreen: (context) => ResultsPageScreen(),
    // favoritesPageEmptyScreen: (context) => FavoritesPageEmptyScreen(),
    // favoritesPageScreen: (context) => FavoritesPageScreen(),
    // appNavigationScreen: (context) => AppNavigationScreen()
  };
}
