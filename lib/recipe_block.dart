//template for creating a recipe block (or tile)
import 'package:flutter/material.dart';
import 'package:kusina_app_v3/screens/recipe_instructions_page_screen.dart';
import 'package:kusina_app_v3/styles.dart';
import 'recipe.dart';
import 'package:kusina_app_v3/routes/app_routes.dart';

class RecipeBlock extends StatelessWidget {
  RecipeBlock({required this.recipe, this.onPress}){
    recipe = this.recipe;//pass the recipe object to be used in this block
    text = recipe.name;//pass the recipe's name to this block
    //imagePath = recipe.imagePath;
  }

  //named parameters
  Recipe recipe;
  final Function()? onPress;

  //from recipe object
  String text = 'Recipe name';
  String imagePath = '';

  //styling
  final Color color = kBlockColor; //block color

  Widget _buildRecipeBlock(){
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
  Widget _buildTextSection(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,9,16,9),
      child: Text(
        text!, //recipe name text
        style: kRecipeBlockTextTextStyle,
      ),
    );
  }
  Widget _buildImageContainer(){
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Colors.red,//show red container if walang picture
        // image: DecorationImage(
        //   image: AssetImage(imagePath),
        //   fit: BoxFit.cover,
        // ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        RecipeInstructionsPageScreen.selectedRecipe = recipe; //pass the recipe object in this block to recipe instructions page
        Navigator.pushNamed(context, AppRoutes.recipeInstructionsPageScreen);
      },
      child: _buildRecipeBlock(),
    );
  }
}