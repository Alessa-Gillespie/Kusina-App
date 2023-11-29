import 'package:flutter/material.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/buttons.dart';
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
    height: 170, //this should be the image height
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(
          10.0), //TODO: Fix border radius border between container/image and text should be 0
    ),
  );

  //if button is pressed, it will change its color
  bool isMiddleButtonPressed = false;

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
                    child: placeholder,//child height should be 170
                    //recipe's image
                    text:
                        'Recipe Name',
                    //recipe's name
                    color: kBlockColor,
                    onPress: () {
                      //TODO: direct to recipe instruction page
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
                    text: 'breakfast',
                    onPress: () {
                      //change button color
                      setState((){
                        IngredientButton.changeButtonColor();
                      });
                      //add to some list for processing for result?
                    },
                  ),
                  SizedBox(height: 10,),
                  FilterButton(
                    text: 'breakfast',
                    onPress: () {
                      //change button color
                      setState((){
                        FilterButton.changeButtonColor();
                      });
                      //add to some list for processing for result?
                    },
                  ),
                  SizedBox(height: 10,),
                  BottomButton(
                    text: 'Bottom Button',
                    onPress: () {
                      //change button color
                      setState((){
                        BottomButton.changeButtonColor();
                      });
                      //add to some list for processing for result?
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
