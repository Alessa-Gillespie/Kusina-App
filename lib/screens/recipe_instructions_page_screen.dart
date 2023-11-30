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

class RecipeInstructionsPageScreen extends StatefulWidget {
  @override
  _RecipeInstructionsPageScreenState createState() => _RecipeInstructionsPageScreenState();
}

class _RecipeInstructionsPageScreenState extends State<RecipeInstructionsPageScreen> {
  //attributes of the selected recipe - should not be hardcoded and instead apply OOP
  String imagePath = 'images/Tinola.jpg';//used in _buildImageContainer()
  String recipeName = 'Recipe Name';
  String recipeIngredients = 'Recipe Ingredients list';
  //instruction
  //video url
  //source url

  //styling
  Icon inactiveHeart =  Icon(
    FontAwesomeIcons.heart,
    color: kTextColor,
  );
  Icon activeHeart =  Icon(
    FontAwesomeIcons.solidHeart,
    color: kMainColor,
  );
  bool isHeartIconPressed = false;

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

  Widget _buildImageContainer(){
    return  Container(
      width: 600,
      height: 220,
      color: Colors.blue,
      //TODO: please help in fixing this. this should display the recipe image
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(imagePath),
      //     fit: BoxFit.cover,
      //   ),
      // ),
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
                Text(//recipe name
                  recipeName,
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
              child: _buildActionButtons(),
            ),
          ]
        ),
      ),
    );
  }

  Widget _buildActionButtons(){
    Widget heartIcon = FloatingActionButton.small(
      onPressed: (){
        setState(() {
          isHeartIconPressed == true
              ? isHeartIconPressed = false
              : isHeartIconPressed = true;
        });
      },
      backgroundColor: Colors.transparent,
      elevation: 0,
      child:  isHeartIconPressed == true
          ? activeHeart
          : inactiveHeart,
    );
    Widget listIcon = FloatingActionButton.small(
      onPressed: (){
        //TODO: pass variables and go to missing list screen
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

  Widget _buildIngredientsContainer(){
    Text subheading = Text(
      'Ingredients',
      style: kRecipeInstrucSubheadingTextStyle,
    );
    Widget ingredient = Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        '100 tsp    incompatible type BoxParentData',
        style: kBodyTextStyle,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subheading,
        SizedBox(height: 15),
        //TODO: make some kind of a builder to dynamically display ingredients from the recipe's ingredient list
        ingredient,
        ingredient,
        ingredient,
        ingredient,
        ingredient,
        ingredient,
        ingredient,
        ingredient,
      ],
    );
  }

  Widget _buildInstructionsContainer(){
    Text subheading = Text(
      'Instructions',
      style: kRecipeInstrucSubheadingTextStyle,
    );
    Widget instructions = Container(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        '1. do this do that do this do that do this do that do this do that do this do that do this do that',
        style: kBodyTextStyle,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subheading,
        SizedBox(height: 15),
        //TODO: make some kind of a builder to dynamically display procedures from the recipe's instuctions list
        instructions,
        instructions,
        instructions,
        instructions,
        instructions,
        instructions,
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
      'https://url-ng-recipe.com/recipe',
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
          _buildImageContainer(),
          _buildRecipeContainer(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: _buildBackButton(),
    );
  }

}