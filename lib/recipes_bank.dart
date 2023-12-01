//this class contains the collection of recipes that will be used by the screen
// pages to display recipes
import 'package:kusina_app_v3/recipes/lugaw.dart';

import 'recipe.dart';
class RecipeBank {
  static final List recipeBank = [
    Lugaw(),//option 1, list the constructor but import the package,
    Recipe(
      name: 'Lugaw',
      imagePath: '',
      ingredientsList: [
      '1 cup long grain white rice',
      '4 to 5 cups water',
      '2 teaspoons salt',
      '1/4 cup rousong pork floss',
      ],
      instructionsList: [
        '1. Pour water in a cooking pot. Bring to a boil.'
        '2. Put-in the rice. Continue cooking for 30 minutes or until the texture becomes thick, while stirring once in awhile.'
        '3. Add the salt, stir and then cook for 2 minutes more.',
        '4. Transfer to a serving bowl. Top with a tablespoon of rousing.',
        '5. Serve hot. Share and enjoy!',
      ],
    //video:
     sourceLink: 'https://panlasangpinoy.com/lugaw-recipe/', //source
    ),//option 2, type Recipe, relatively easy to access, but code will be lengthy
  ];

/*
 Recipe getRecipe(String searchName) {//used by results page (model?) to pass recipe objects to recipe_block.dart
    //TODO: iterate list, search Recipe object with the attribute name == searchName
      /*
      pseudocode:
      for (int=0, i < recipeBank.length; nextitem){
        //compare each recipeBank[i].name == searchName
          //if true: return recipeBank[i] (recipe object, not its name only)
          //if false: next item
          //if nareach na yung end and wala talaga: idk what to do hahaha catch error???
      }
      */
 }
 */

  /* FROM QUIZZLER>QUESTIONBANK
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }
  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
     print('Now returning true');
      return true;

    } else {
      return false;
    }
  }
  void reset() {
    _questionNumber = 0;
  }
  */
}
