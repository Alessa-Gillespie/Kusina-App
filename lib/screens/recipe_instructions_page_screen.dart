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

class RecipeInstructionsPageScreen extends StatefulWidget {
  //the static variable kung san pinapass ni recipe_block yung recipe object niya
  //static para kada tap ng recipe block, nag iiba yung magdidisplay depende sa anong recipe object ang nasa recipe_block
  static Recipe selectedRecipe = Recipe.initialization(); //for initialization only. displays placeholder stuff for name, ingredients etc.
                                                          // this is expected to change if may pinass na variable si recipe_block

  @override
  _RecipeInstructionsPageScreenState createState() => _RecipeInstructionsPageScreenState();
}

class _RecipeInstructionsPageScreenState extends State<RecipeInstructionsPageScreen> {

  final Recipe _recipe = RecipeInstructionsPageScreen.selectedRecipe; //the passed recipe object from recipe_block

  _RecipeInstructionsPageScreenState(){ //access _recipe's attribute and set
    _recipeImagePath = _recipe.imagePath;
    _recipeName = _recipe.name;
    _recipeIngredients = _recipe.ingredientsList;
    _recipeInstructions = _recipe.instructionsList;
    //add recipeVideo
    _recipeSourceLink = _recipe.sourceLink;
  }

  //class's own copy of attributes of _recipe, the class's own private copy of the passed recipe from recipe_block
  String? _recipeImagePath;//used in _buildImageContainer() below
  String? _recipeName;//used in _buildRecipeContainer() below
  List<String>? _recipeIngredients; //used in _buildIngredientsContainer() below
  List<String>? _recipeInstructions; //used in _buildInstructionsContainer() below
  //add recipeVideo
  String? _recipeSourceLink; //used in _buildSourceContainer() below

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

  Widget _buildImageContainer(){
    return  Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
                image: AssetImage(_recipeImagePath!),
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
                Text(//recipe name
                  _recipeName!,
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
        //TODO: add this functionality: heart icon is pressed, this should display in favorites
        setState(() {
          isHeartIconPressed == true
              ? isHeartIconPressed = false
              : isHeartIconPressed = true;
        });
      },
      backgroundColor: Colors.transparent,
      elevation: 0,
      child:  isHeartIconPressed == true
          ? activeHeart //TODO: find a way to make color stay on if pressed whenever recipe instruction page is launched
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

  Widget _getTextWidgets (List<String>? strings){ //extracts items from list and puts each in a widget in a column
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: strings!.map((item) => Container(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            item,
            // textAlign: TextAlign.justify,
            style: kBodyTextStyle.copyWith(height: 1.5),
          ),
        )).toList()
    );
  }

  Widget _buildIngredientsContainer(){
    Text subheading = Text('Ingredients', style: kRecipeInstrucSubheadingTextStyle,);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subheading,
        SizedBox(height: 15),
        _getTextWidgets(_recipeIngredients),
      ],
    );
  }

  Widget _buildInstructionsContainer(){
    Text subheading = Text(
      'Instructions',
      style: kRecipeInstrucSubheadingTextStyle,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subheading,
        SizedBox(height: 15),
        //TODO: make some kind of a builder to dynamically display procedures from the recipe's instuctions list
        // instructions,
        // instructions,
        // instructions,
        _getTextWidgets(_recipeInstructions),
      ],
    );
  }

  //TODO: display video here
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
      _recipeSourceLink!,
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
      backgroundColor: kBlockColor,
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
