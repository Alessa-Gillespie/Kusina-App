//to create a Recipe object for recipes bank
class Recipe {
  Recipe.initialization(){ //contains placeholder stuff for each attribute
    //for example, if  you get Recipe.initialization()'s name, it will give you literally 'Recipe name'
    name = 'Recipe name';
    imagePath =  '';
    ingredientsList = ['1 cup item','1 cup item','1 cup item'];
    instructionsList = ['1. do this', '1. do this', '1. do this'];
    sourceLink = 'https://url-ng-recipe.com/recipe';
  }

  //this is used to store a recipe's attributes
  //for example,
  /*
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
    );
  */
  Recipe({this.name, this.imagePath, this.ingredientsList, this.instructionsList,/*video, */ this.sourceLink});

  String? name;
  String? imagePath;
  List<String>? ingredientsList;
  List<String>? instructionsList;
  //video
  String? sourceLink;
}