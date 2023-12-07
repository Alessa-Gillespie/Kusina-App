import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/button_components.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';
import 'package:kusina_app_v3/styles.dart';
import 'package:kusina_app_v3/navbar.dart';
import 'dart:math';


// Import the provider packages
import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

const spaceBetweenTextAndBlock = 17;
const spaceBetweenRecipeBlocks = 18;

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  //if button is pressed, it will change its color
  bool isMiddleButtonPressed = false;
  Widget buildImageContainer(String imagePath) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    List<RecipeBlock> recipes = [
      RecipeBlock(
        child: buildImageContainer('images/Tinola.jpg'),
        text: 'Tinola',
        color: Colors.white,
        onPress: () {
          final buttons = context.read<ButtonsModel>();
          buttons.setMyRecipe('Tinola');
          Navigator.pushNamed(context, AppRoutes.tinola);
        },
      ),
      RecipeBlock(
        child: buildImageContainer('images/menudo.jpg'),
        text: 'Menudo',
        color: Colors.white,
        onPress: () {
          final buttons = context.read<ButtonsModel>();
          buttons.setMyRecipe('Menudo');
          Navigator.pushNamed(context, AppRoutes.menudo);
        },
      ),
      RecipeBlock(
        child: buildImageContainer('images/lumpiang_shanghai.jpg'),
        text: 'Lumpiang Shanghai',
        color: Colors.white,
        onPress: () {
          final buttons = context.read<ButtonsModel>();
          buttons.setMyRecipe('Lumpiang Shanghai');
          Navigator.pushNamed(context, AppRoutes.lumpiang_shanghai);
        },
      ),
      RecipeBlock(
        child: buildImageContainer('images/omelet.jpg'),
        text: 'Omelet',
        color: Colors.white,
        onPress: () {
          final buttons = context.read<ButtonsModel>();
          buttons.setMyRecipe('Omelet');
          Navigator.pushNamed(context, AppRoutes.omelet);
        },
      ),
      RecipeBlock(
        child: buildImageContainer('images/bulalo.png'),
        text: 'Bulalo',
        color: Colors.white,
        onPress: () {
          final buttons = context.read<ButtonsModel>();
          buttons.setMyRecipe('Bulalo');
          Navigator.pushNamed(context, AppRoutes.bulalo);
        },
      ),
      RecipeBlock(
        child: buildImageContainer('images/champorado.png'),
        text: 'Champorado',
        color: Colors.white,
        onPress: () {
          final buttons = context.read<ButtonsModel>();
          buttons.setMyRecipe('Champorado');
          Navigator.pushNamed(context, AppRoutes.champorado);
        },
      ),
      RecipeBlock(
        child: buildImageContainer('images/cassava_cake.jpg'),
        text: 'Cassava Cake',
        color: Colors.white,
        onPress: () {
          final buttons = context.read<ButtonsModel>();
          buttons.setMyRecipe('Cassava Cake');
          Navigator.pushNamed(context, AppRoutes.cassava_cake);
        },
      ),
      RecipeBlock(
        child: buildImageContainer('images/Tapsilog.jpg'),
        text: 'Tapsilog',
        color: Colors.white,
        onPress: () {
          final buttons = context.read<ButtonsModel>();
          buttons.setMyRecipe('Tapsilog');
          Navigator.pushNamed(context, AppRoutes.tapsilog);
        },
      ),
      RecipeBlock(
        child: buildImageContainer('images/daing.jpg'),
        text: 'Daing',
        color: Colors.white,
        onPress: () {
          final buttons = context.read<ButtonsModel>();
          buttons.setMyRecipe('Daing');
          Navigator.pushNamed(context, AppRoutes.daing);
        },
      ),
      // Add more recipes here...
    ];
    final random = Random();
    final recipe = recipes[random.nextInt(recipes.length)];
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
          Container(
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
                  Text('What ingredients \ndo you have?',
                    textAlign: TextAlign.center,
                    style: kHeading1TextStyle,
                  ),
                  SizedBox(  height: 17,),
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Recipe Suggestion',
                      style: kBodyBoldTextStyle,
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, AppRoutes.resultsPageScreen);
                      },
                      child: Text(
                          'See more',
                          style: kSmallTextStyle
                      ),
                    ),
                  ],
                ),
                SizedBox( height: 17, //spaceBetweenTextAndBlock
                ),
                recipe,
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 0,
      ),
    );
  }
}