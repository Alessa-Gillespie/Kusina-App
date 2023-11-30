//TODO: disable back button in app from home
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/button_components.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';
import 'package:kusina_app_v3/styles.dart';
import 'package:kusina_app_v3/navbar.dart';

const spaceBetweenTextAndBlock = 17;
const spaceBetweenRecipeBlocks = 18;

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
                    //TODO: link to recipes page (no selected ingredients)
                    Navigator.pushNamed(context, AppRoutes.ingredientsPageScreen);
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
              child: placeholder,//child height should be 170
              //recipe's image
              text:'Recipe Name',
              //recipe's name
              color: kBlockColor,
              onPress: () {
                Navigator.pushNamed(context, AppRoutes.recipeInstructionsPageScreen);
              },
            ),
            RecipeBlock(
              child: placeholder,
              text: 'Long Recipe Name Recipe Name Recipe Recipe Name ',
              color: kBlockColor,
              onPress: () {
                //TODO: direct to recipe instruction page
              },
            ),
            RecipeBlock(
              child: placeholder,
              text: 'Recipe Name',
              color: kBlockColor,
              onPress: () {
                //TODO: direct to recipe instruction page
              },
            ),
            IngredientButton(
              text: 'Chicken',
              onPress: () {
                //change button color
                setState((){
                  IngredientButton.changeButtonColor();
                });
                //add to some list for processing for result?
              },
            ),
            SizedBox(height: 10,),
            BottomButton(
              text: 'Shortcut to [insert page]',
              onPress: () {
                //change button color
                setState((){
                  BottomButton.changeButtonColor();
                });
                //Navigator.pushNamed(context, AppRoutes.favoritesPageScreen);
                //add to some list for processing for result?
              },
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
        //TODO: edit the header (add color, change font style)
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
        // onPress: (){
        //   Navigator.pushNamed(context, AppRoutes.ingredientsPageScreen);
        // },
      ),
    );
  }
}
