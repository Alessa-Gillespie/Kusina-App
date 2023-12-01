//TODO: edit RecipeBlock

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/button_components.dart';
import 'package:kusina_app_v3/recipes_bank.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';
import 'package:kusina_app_v3/styles.dart';
import 'package:kusina_app_v3/navbar.dart';
import 'package:kusina_app_v3/recipe.dart'; //temporary. import recipe bank instead

//TEMPORARY
Recipe lugawRecipeObject =  Recipe(
  name: 'Lugaw (from home page)',
  imagePath: 'images/Tinola.jpg',
  ingredientsList: [
    '1 cup long grain white rice',
    '4 to 5 cups water',
    '2 teaspoons salt',
    '1/4 cup rousong pork floss',
  ],
  instructionsList: [
    '1. Pour water in a cooking pot. Bring to a boil.',
    '2. Put-in the rice. Continue cooking for 30 minutes or until the texture becomes thick, while stirring once in awhile.',
    '3. Add the salt, stir and then cook for 2 minutes more.',
    '4. Transfer to a serving bowl. Top with a tablespoon of rousing.',
    '5. Serve hot. Share and enjoy!',
  ],
  //video:
  sourceLink: 'https://panlasangpinoy.com/lugaw-recipe/', //source
);
Recipe tinolaRecipeObject =  Recipe( //incomplete info for attributes
  name: 'Tinola (from home page)',
  imagePath: 'images/Tinola.jpg',
  ingredientsList: [
    '1 cup long grain white rice',
    '4 to 5 cups water',
    '2 teaspoons salt',
    '1/4 cup rousong pork flosss',
  ],
  instructionsList: [
    '1. Pour water in a cooking pot. Bring to a boil.',
    '2. Put-in the rice. Continue cooking for 30 minutes or until the texture becomes thick, while stirring once in awhile.',
    '3. Add the salt, stir and then cook for 2 minutes more.',
    '4. Transfer to a serving bowl. Top with a tablespoon of rousing.',
    '5. Serve hot. Share and enjoy!',
  ],
  //video:
  sourceLink: 'https://panlasangpinoy.com/lugaw-recipe/', //source
);

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  //if button is pressed, it will change its color
  bool isMiddleButtonPressed = false;

  //TEMPORARY CONTAINER PLACEHOLDER FOR IMAGE
  Container placeholder = Container(
    //put image widget here instead of container
    height: 170, //this should be the image height
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(
          10.0), //TODO: Fix border radius border between container/image and text should be 0
    ),
  );

  Widget _buildIngredientsSection(){
    return Container(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(78.32, 0, 78.32, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ready to cook?',
              style: kBodyTextStyle,
            ),
            SizedBox(height: 17),
            Text(
              'What ingredients \ndo you have?',
              textAlign: TextAlign.center,
              style: kHeading1TextStyle,
            ),
            SizedBox(height: 17),
            MiddleButton(
              text: 'Select Ingredients',
              icon: Icons.arrow_forward_rounded,
              onPress: () {
                setState(() {
                  MiddleButton.changeButtonColor();
                });
                Navigator.pushNamed(context, AppRoutes.ingredientsPageScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeSuggestionsBlock() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
      child: Expanded(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Recipe Suggestions',
                  style: kBodyBoldTextStyle,
                ),
                TextButton(
                  onPressed: (){
                    //TODO: link MiddleButton to recipes page (no selected ingredients)
                    Navigator.pushNamed(context, AppRoutes.ingredientsPageScreen);//temporary only
                  },
                  child: Text(
                      'See more',
                      style: kSmallTextStyle
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17, //spaceBetweenTextAndBlock
            ),
            RecipeBlock(
              recipe: lugawRecipeObject
            ),
            RecipeBlock(
                recipe: tinolaRecipeObject
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Kusina',
          style: GoogleFonts.sansitaSwashed(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          _buildIngredientsSection(),
          _buildRecipeSuggestionsBlock(),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 0, //lets NavBar() know what page this is. 0 = home, 1 = recipes, and so on
      ),
    );
  }
}
