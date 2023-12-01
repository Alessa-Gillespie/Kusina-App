/*
this class is used as a TEMPLATE/blueprint for displaying a recipe and
its role is :
- to DISPLAY attributes of the selected recipe,
- to add the selected recipe to favorites list if the heart button is pressed
- to provide the list button (sends the recipe's ingredients to missing ingredients page)

it should be displayed from tapping a recipe block.

*/

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/button_components.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';
import 'package:kusina_app_v3/styles.dart';
import 'package:kusina_app_v3/navbar.dart';
import 'package:kusina_app_v3/recipe.dart';
import 'package:kusina_app_v3/recipes_bank.dart';

// Import the provider packages
import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

class Cassava_Cake extends StatefulWidget {

  @override
  _Cassava_CakeState createState() => _Cassava_CakeState();
}

class _Cassava_CakeState extends State<Cassava_Cake> {

  //TODO: fix the error in order to use selectedRecipe object that is passed from recipe_block.dart
  //attributes of the selected recipe
  // String imagePath = selectedRecipe.imagePath;//used in _buildImageContainer()
  String recipeName = 'Recipe Name';//selectedRecipe.name;
  // List<String> recipeIngredients = selectedRecipe.ingredientsList;
  // List<String> recipeInstructions = selectedRecipe.instructionsList;
  // //add selected recipe's video link
  // String recipeSourceLink = selectedRecipe.sourceLink;

  //styling
  bool isHeartIconPressed = false;
  Icon inactiveHeart =  Icon(
    FontAwesomeIcons.heart,
    color: kTextColor,
  );
  Icon activeHeart =  Icon(
    FontAwesomeIcons.solidHeart,
    color: kMainColor,
  );

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

  Widget _buildImageContainer(String imagePath){
    return Container(
      width: 600,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.blue, // Move the color property here
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildRecipeContainer(){
    return  Padding(
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 25),
      child: Expanded(
        child: Stack(
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Cassava Cake',
                    style: kHeading1TextStyle,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 30), //gap
                  _buildIngredientsContainer(),
                  SizedBox(height: 30), //gap
                  _buildInstructionsContainer(),
                  SizedBox(height: 30), //gap
                  _buildVideoContainer(),
                  SizedBox(height: 35),
                  _buildSourceContainer(),
                ],
              ),
              Positioned(
                top: -10,
                right: 0,
                child: _buildActionButtons('cassava_cake'),
              ),
            ]
        ),
      ),
    );
  }

  Widget _buildActionButtons(String heartIconId){
    return Consumer<ButtonsModel>(
        builder: (context, heartIconModel, child) {
          Widget heartIcon = FloatingActionButton.small(
            onPressed: (){
              heartIconModel.toggleHeartIcon(heartIconId);
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            child:  heartIconModel.isHeartIconPressed(heartIconId) == true
                ? activeHeart
                : inactiveHeart,
          );
          Widget listIcon = FloatingActionButton.small(
            onPressed: (){
              final buttons = context.read<ButtonsModel>();
              Navigator.pushNamed(context, AppRoutes.missingIngredients);
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Icon(
              FontAwesomeIcons.list,
              color: kTextColor,
            ),
          );
          return Column(
            children: [
              heartIcon,
              listIcon,
            ],
          );
        }
    );
  }

  Widget _buildIngredientsContainer(){
    Text subheading = Text(
      'Ingredients',
      style: kRecipeInstrucSubheadingTextStyle,
    );

    // List of ingredients
    List<String> ingredients = [
      '2 packs Grated Cassava, about 2 lbs total weight',
      '2 cups Coconut Milk',
      '1/2 12 oz. can Evaporated Milk',
      '3 pieces Egg',
      '1/4 cup Butter, melted',
      '6 tablespoons Cheddar Cheese, grated',
      '1/2 cup Condensed Milk',
      '14 tablespoons Granulated White Sugar',
      '',
      'Topping Ingredients',
      '2 tablespoons Flour',
      '2 tablespoons Sugar',
      '1/2 cup Condensed Milk',
      '2 tablespoons Cheddar Cheese, grated',
      '2 cups Coconut Milk'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subheading,
        SizedBox(height: 15),
        // Generate ingredient widgets dynamically
        for (var ingredient in ingredients)
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              ingredient,
              style: kBodyTextStyle,
            ),
          ),
      ],
    );
  }

  Widget _buildInstructionsContainer(){
    Text subheading = Text(
      'Instructions',
      style: kRecipeInstrucSubheadingTextStyle,
    );

    // List of instructions
    List<String> instructionsList = [
      '1. Make the batter by combining the grated cassava, butter, 1/2 cup condensed milk, 1/2 cup evaporated milk, 6 tablespoons cheddar cheese, 14 tablespoons sugar, and 2 eggs in a mixing bowl and mix thoroughly.',
      '2. Add the 2 cups coconut milk in the mixing bowl where the mixed ingredients are. Mix again.',
      '3. Grease the baking tray then pour-in the batter (these are the ingredients that you just mixed together).',
      '4. Pre -heat oven for 350 degrees Fahrenheit for 10 minutes then put-in the baking tray with batter and bake for 1 hour. Remove from the oven and set aside.',
      '5. Meanwhile prepare the topping by combining 2 tablespoons sugar and flour in the heated saucepan.',
      '6. Pour-in 1/2 cup condensed milk then mix thoroughly.',
      '7. Add 2 tablespoons cheddar cheese while stirring constantly.',
      '8. Pour 2 cups of coconut milk and stir constantly for 10 minutes',
      '9. Pour the topping over the Cassava Cake (baked batter) and spread evenly.',
      '10. Separate the yolk from the egg white of the remaining egg (we’ll be needing the egg white only)',
      '11. Glaze the topping with the egg white using a basting brush. Simply dip the brush to the egg white and brush it on the cassava cake.',
      '12. Set your oven to broil mode. Broil the Cassava cake until color turns light brown.',
      '13. Garnish with extra grated cheese on top. Serve. Share and enjoy.',
      // Add more instructions as needed
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subheading,
        SizedBox(height: 15),
        // Generate instruction widgets dynamically
        for (var instruction in instructionsList)
          Container(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              instruction,
              style: kBodyTextStyle,
            ),
          ),
      ],
    );
  }

  Widget _buildVideoContainer(){
    Text subheading = Text(
      'Video',
      style: kRecipeInstrucSubheadingTextStyle,
    );

    Container videoContainer = Container(
      width: 600,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.red,
        // image: DecorationImage(
        //   image: AssetImage(imagePath),
        //   fit: BoxFit.cover,
        // ),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subheading,
        SizedBox(height: 15),
        videoContainer,
      ],
    );
  }

  Widget _buildSourceContainer(){
    Text subheading = Text(
      'Source',
      style: kRecipeInstrucSubheadingTextStyle,
    );

    Text link = Text(
      'https://panlasangpinoy.com/filipino-food-dessert-holiday-cassava-cake-recipe/',
      style: kBodyTextStyle,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subheading,
        SizedBox(height: 10),
        link,
      ],
    );
  }

  Widget _buildBackButton(){
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: FloatingActionButton(
        onPressed: (){
          //TODO: copy back button functionality of AppBar built-in class
          //goes back from the where the recipe block is pressed (from home, recipes, or results)
          Navigator.pushNamed(context, AppRoutes.homePage); //temporary only
        },
        backgroundColor: kBlockColor,
        shape: CircleBorder(),
        elevation: 3,
        child: Icon(
          Icons.arrow_back_rounded,
          color: kMainColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: <Widget>[
          _buildImageContainer('images/cassava_cake.jpg'),
          _buildRecipeContainer(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: _buildBackButton(),
    );
  }

}