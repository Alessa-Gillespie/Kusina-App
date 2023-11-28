import 'package:flutter/material.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/rounded_button.dart';

//for headings etc.
const kBigBoldTextStyle = TextStyle(
  fontSize: 27.49,
  fontWeight: FontWeight.w800,
  height: 1.1,
);

//default font size and weight
const kNormalTextStyle = TextStyle(
  fontSize: 16.99,
  color: Colors.black,
);

const kNormalBoldTextStyle = TextStyle(
  fontSize: 16.99,
  color: Colors.black,
  fontWeight: FontWeight.w800,
);

const kSeeMoreTextStyle = TextStyle(
  fontSize: 10.5,
);

//background color
const backgroundColor = Color(0xFFFFFDE7);

const spaceBetweenTextAndBlock = 17;

const spaceBetweenRecipeBlocks = 18;

const kInactiveButtonColor = Colors.yellow;

const kActiveButtonColor = Colors.black;

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
      backgroundColor: backgroundColor,
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
                    style: kNormalTextStyle,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Text('What ingredients \ndo you have?',
                      textAlign: TextAlign.center, style: kBigBoldTextStyle),
                  SizedBox(
                    height: 17,
                  ),
                  RoundedButton(
                    text: 'Select Ingredients',
                    icon: Icons.arrow_forward_rounded,
                    color: isButtonPressed == false
                        ? kInactiveButtonColor
                        : kActiveButtonColor,
                    onPress: () {
                      setState(() {
                        isButtonPressed =
                            isButtonPressed == false ? true : false;
                      });
                      print(isButtonPressed);
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
                        style: kNormalBoldTextStyle,
                      ),
                      Text('See more', style: kSeeMoreTextStyle),
                    ],
                  ),
                  SizedBox(
                    height: 17, //spaceBetweenTextAndBlock
                  ),
                  RecipeBlock(
                    child: placeholder,
                    //recipe's image
                    text:
                        'Long Recipe Name Recipe Name Recipe Name Recipe Name Recipe Name Recipe Name',
                    //recipe's name
                    color: Colors.white,
                    onPress: () {
                      //TODO: direct to recipe instruction page
                    },
                  ),
                  RecipeBlock(
                    child: placeholder,
                    text: 'Recipe Name',
                    color: Colors.white,
                    onPress: () {
                      //TODO: direct to recipe instruction page
                    },
                  ),
                  RecipeBlock(
                    child: placeholder,
                    text: 'Recipe Name',
                    color: Colors.white,
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
