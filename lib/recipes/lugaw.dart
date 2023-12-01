class Lugaw {
  String _name = 'Lugaw';
  String? imagePath;
  List<String> ingredientsList = [
    '1 cup long grain white rice',
    '4 to 5 cups water',
    '2 teaspoons salt',
    '1/4 cup rousong pork floss',
  ];
  List<String> instructionsList = [
    '1. Pour water in a cooking pot. Bring to a boil.'
        '2. Put-in the rice. Continue cooking for 30 minutes or until the texture becomes thick, while stirring once in awhile.'
        '3. Add the salt, stir and then cook for 2 minutes more.',
    '4. Transfer to a serving bowl. Top with a tablespoon of rousing.',
    '5. Serve hot. Share and enjoy!',
  ];
  //String video;
  String sourceLink = 'https://panlasangpinoy.com/lugaw-recipe/'; //source

  //getters
  String getName(){
    return _name;
  }
}

/*
Lugaw().name
 */