import 'package:flutter/material.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/rounded_button.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';
import 'package:kusina_app_v3/styles.dart';

const spaceBetweenTextAndBlock = 17;
const spaceBetweenRecipeBlocks = 18;

/*
const kInactiveButtonColor = Colors.yellow;
const kActiveButtonColor = Colors.black;
*/
class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  //TEMPORARY CONTAINER PLACEHOLDER FOR IMAGE
  Container placeholder = Container(
    //put image widget here instead of container
    height: 130,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(
          10.0), //TODO: Fix border radius border between container/image and text should be 0
    ),
  );

  //if button is pressed, it will change its color
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        //TODO: edit the header (add color, change font style)
        title: Text('Kusina'),
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
                  SizedBox(
                    height: 17,
                  ),
                  Text('What ingredients \ndo you have?',
                      textAlign: TextAlign.center,
                      style: kHeading1TextStyle,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  RoundedButton(
                    text: 'Select Ingredients',
                    icon: Icons.arrow_forward_rounded,
                    color: isButtonPressed == false
                        ? kInactiveFilledButtonColor
                        : kActiveFilledButtonColor,
                    onPress: () {
                      Navigator.pushNamed(context, AppRoutes.ingredientsPageScreen);
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Text>[
                      Text(
                        'Recipe Suggestions',
                        style: kBodyBoldTextStyle,
                      ),
                      Text('See more', style: kSmallTextStyle),
                    ],
                  ),
                  SizedBox(
                    height: 17, //spaceBetweenTextAndBlock
                  ),
                  RecipeBlock(
                    child: placeholder,
                    //recipe's image
                    text:
                        'Long Recipe Name Recipe Name Recipe',
                    //recipe's name
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
                  RecipeBlock(
                    child: placeholder,
                    text: 'Recipe Name',
                    color: kBlockColor,
                    onPress: () {
                      //TODO: direct to recipe instruction page
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
