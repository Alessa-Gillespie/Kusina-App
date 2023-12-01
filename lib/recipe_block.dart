//template for creating a recipe block (or tile)
import 'package:flutter/material.dart';
import 'package:kusina_app_v3/screens/recipe_instructions_page_screen.dart';
import 'package:kusina_app_v3/styles.dart';
import 'recipe.dart';
import 'package:kusina_app_v3/routes/app_routes.dart';

class RecipeBlock extends StatelessWidget {
  //constructor for initialization
  RecipeBlock({Recipe? recipe}){//access the recipe object's attributes such as name and image
    _recipe = recipe; //'_recipe' is class' own copy of recipe object, while 'recipe' is the passed recipe object
    _recipeImagePath = _recipe?.imagePath; //access recipe's imagePath
    _recipeName = _recipe?.name; //access recipe's name
  }
  //named parameter (eto yung hinihingi pag gagamitin mo RecipeBlock widget)
  Recipe? _recipe;
  //attributes of _recipe, the class's own private copy of the passed recipe object
  String? _recipeImagePath;//used in
  String? _recipeName;//used in

  //styling
  final Color color = kBlockColor; //block color

  Widget _buildRecipeBlock(){ //contains the recipe's image and text
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(bottom: 22),
          decoration: BoxDecoration(
              color: color, //block color
              borderRadius: BorderRadius.circular(10.0),
              boxShadow:  [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageContainer(),
              _buildTextSection(),
            ],
          )
      ),
    );
  }
  Widget _buildImageContainer(){//contains the recipe's image
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Colors.red,//show red container if walang picture
        image: DecorationImage(
          image: AssetImage(_recipeImagePath!),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
  Widget _buildTextSection(){ //contains the recipe's name
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,9,16,9),
      child: Text(
        _recipeName!,
        style: kRecipeBlockTextTextStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        RecipeInstructionsPageScreen.selectedRecipe = _recipe!; //pass the recipe object in this class to recipe instructions page's static variable
        //recipe instructions page will use this recipe object to display its attributes such as the name, ingredients, instructions, etc.
        Navigator.pushNamed(context, AppRoutes.recipeInstructionsPageScreen);
      },
      child: _buildRecipeBlock(),
    );
  }
}