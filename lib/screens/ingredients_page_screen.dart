/*
//TODO: align ingredients buttons to the left

Pseudocode:
int GapBetweenButtons

List  <Ingredient Button> categoryIngredients           //each category can
  //contains all ingredient buttons under a category     have a different list or you can come from one list
                                                          containing all ingredients pero categorized


method rowBuilder(categoryIngredients)
  for(initial: 0; until list.length; nextItemOnList())
    if button.length is kasya pa sa width ng row
      add button to row
      add GapBetweenButtons
    else
      create new row and add that button

  return Column

//widget containing ingredient buttons
method ingredientBlockBuilder(category) //can be used by different categories
  return Expanded //to take all remaining space
          child: rowBuilder




Code Notes:

(^1)
constructor for the IngredientsPageScreen class.
The const keyword means that you can create a compile-time
constant of this class. This can lead to performance improvements
by allowing Flutter to reuse widget instances.

(^2)
MaterialButton is a utility class for building Material.
MaterialButton has no elevation and therefore doesn’t cast a shadow.
It is a base class for other button widgets, such as TextButton,
OutlinedButton, IconButton, etc. It can also be used to create custom
buttons with different shapes, colors, and effects. It has many
properties that can be adjusted to suit the needs of the app,
such as onPressed, onLongPress, elevation, highlightElevation,
disabledElevation, color, textColor, disabledColor, disabledTextColor,
splashColor, highlightColor, shape, clipBehavior, animationDuration,
minWidth, height, etc

(^3)
This code is a ternary operator
It is a shorthand way of writing an if-else statement.
It has the following syntax:

condition ? expression1 : expression2

This means that if the condition is true,
then expression1 is executed, otherwise expression2
is executed.

Equivalent:

if (filters[index] == Colors.white) {
  foregroundColor = Colors.black;
} else {
  foregroundColor = Colors.white;
}

 */

import 'package:flutter/material.dart';
import 'package:kusina_app_v3/routes//app_routes.dart'; // Import this to make the Navigation work.
import 'package:kusina_app_v3/styles.dart';

// Import the provider packages
import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

class IngredientsPageScreen extends StatefulWidget {
  @override
  _ingredientsPageScreenState createState() => _ingredientsPageScreenState();
}

class _ingredientsPageScreenState extends State<IngredientsPageScreen> {
 // GlobalKey<NavigatorState> navigatorKey = GlobalKey(); (Ignore for now)
  // const _ingredientsPageScreenState({Key? key}) : super(key: key); // (^1) (Ignore for now)

  Widget _buildIngredientButtons(String label, int index) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.all(3), // Spacing
      child: ElevatedButton(
        onPressed: () {
          // Get the Buttons instance
          final buttons = context.read<ButtonsModel>();
          // Update the ingredients list
          if (buttons.ingredients[index] == Colors.white) {
            buttons.updateIngredientsButton(index, Colors.yellow);
          } else {
            buttons.updateIngredientsButton(index, Colors.white);
          }
        },
        child: Text(label),
        style: ElevatedButton.styleFrom(
          // Use the color from the ingredients list in the Buttons instance
          backgroundColor: context.watch<ButtonsModel>().ingredients[index],
          foregroundColor: Colors.black, // text color
          side: BorderSide(color: Colors.black, width: 1), // border color and width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // adjust as needed
          ),
        ),
      )
    );
  }

  Widget _buildFilterButtons(String label, int index) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: ElevatedButton(
        onPressed: () {
          final buttonsModel = context.read<ButtonsModel>();
          if (buttonsModel.filters[index] == Colors.white) {
            buttonsModel.updateFilters(index, Colors.black);
          } else {
            buttonsModel.updateFilters(index, Colors.white);
          }
          // Handle button press
        },
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: context.watch<ButtonsModel>().filters[index],
          foregroundColor: context.watch<ButtonsModel>().filters[index] == Colors.white ? Colors.black : Colors.white,  // (^3)
          side: BorderSide(color: Colors.black, width: 1), // border color and width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // adjust as needed
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; // Get the screen size

    return Scaffold(
      backgroundColor: kBlockColor,
      appBar: AppBar(
        title: Text('Ingredients'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: screenSize.width * 0.05), // Use a percentage of the screen width
                    child: Text(
                      'Select Ingredients',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenSize.width * 0.05), // Use a percentage of the screen width
                    child: ElevatedButton(
                      onPressed: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.clearFilters();
                        buttons.clearIngredients();
                      },
                      child: Text(
                        'Clear',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.white, width: 0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.015), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Karne / Meat'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                alignment: WrapAlignment.start,
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Beef', 0),
                  _buildIngredientButtons('Chicken', 1),
                  _buildIngredientButtons('Baboy', 2),
                  _buildIngredientButtons('Atay ng Baboy', 35),
                  _buildIngredientButtons('Hotdog', 38),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Gulay at Dahon / Vegetables'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Carrots', 3),
                  _buildIngredientButtons('Patatas', 4),
                  _buildIngredientButtons('Kamatis', 5),
                  _buildIngredientButtons('Sibuyas', 13),
                  _buildIngredientButtons('Bawang', 17),
                  _buildIngredientButtons('Hot Pepper Leaves', 20),
                  _buildIngredientButtons('Kamoteng Kahoy', 27),
                  _buildIngredientButtons('Repolyo', 41),
                  _buildIngredientButtons('Bok Choy', 42),
                  _buildIngredientButtons('Mais', 43),
                  _buildIngredientButtons('Green Onions', 45),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Lamang Dagat / Seafoods'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Isda', 6),
                  _buildIngredientButtons('Hipon', 7),
                  _buildIngredientButtons('Crab', 8),
                ],
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Seasonings & Spice Blends'),
              Wrap( // List of Buttons per Row
                spacing: screenSize.width * 0.02,
                runSpacing: screenSize.height * 0.01,
                children: <Widget>[
                  _buildIngredientButtons('Salt', 14),
                  _buildIngredientButtons('Ground Black Pepper', 21),
                  _buildIngredientButtons('Pamintang Puti', 26),
                  _buildIngredientButtons('Pepper', 40),
                  _buildIngredientButtons('Black Pepper', 44),
                ],
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Prutas / Fruits'),
              Wrap( // List of Buttons per Row
                spacing: screenSize.width * 0.02,
                runSpacing: screenSize.height * 0.01,
                children: <Widget>[
                  _buildIngredientButtons('Mansanas', 9),
                  _buildIngredientButtons('Saging', 10),
                  _buildIngredientButtons('Orange', 11),
                  _buildIngredientButtons('Green Papaya', 16),
                  _buildIngredientButtons('Lemon', 36),
                ],
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Condiments'),
              Wrap( // List of Buttons per Row
                spacing: screenSize.width * 0.02,
                runSpacing: screenSize.height * 0.01,
                children: <Widget>[
                  _buildIngredientButtons('Toyo', 12),
                  _buildIngredientButtons('Patis', 19),
                  _buildIngredientButtons('Knorr Liquid Seasoning', 23),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Grains & Cereals'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Kanin', 15),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Pre-made Doughs & Wrappers'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Lumpia Wrapper', 46),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Sauces & Dips'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Tomato Sauce', 37),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Dairy-Free & Meat Substitutes'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Gata ng Niyog', 18),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Inumin'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Pineapple Juice', 24),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Dairy & Eggs'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Itlog', 22),
                  _buildIngredientButtons('Evaporated Milk', 29),
                  _buildIngredientButtons('Butter', 30),
                  _buildIngredientButtons('Condensed Milk', 32),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Mga Keso'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Cheddar Cheese', 31),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Herbs & Spices'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Luya', 18),
                  _buildIngredientButtons('Dried Bay Leaves', 39),
                  _buildIngredientButtons('Garlic Powder', 47),
                  _buildIngredientButtons('Parsley', 48),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Oils & Fats'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Sesame Oil', 49),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Sugars & Sweeteners'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Brown Sugar', 25),
                  _buildIngredientButtons('White Sugar', 33),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03), // Use a percentage of the screen height
              _buildIngredientCategoryName(context, 'Baking'),
              Wrap( // Use Wrap instead of Row for the list of buttons
                spacing: screenSize.width * 0.02, // Space between children in the main axis
                runSpacing: screenSize.height * 0.01, // Space between children in the cross axis
                children: <Widget>[
                  _buildIngredientButtons('Harina', 34),
                ],
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Filter'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _buildFilterButtons('Breakfast', 0),
                    _buildFilterButtons('Lunch', 1),
                    _buildFilterButtons('Dinner', 2),
                    _buildFilterButtons('Desserts', 3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }
}


Widget _buildIngredientCategoryName(BuildContext context, String category_name) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // MainAxisAlignment.spaceBetween value means that the free space is evenly distributed between the children.
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 20), // To adjust "Select Ingredients Header away from the left edge)
        child: Text(
          category_name,
          style: TextStyle(fontSize: 24),
        ),
      ),
    ],
  );
}

Widget _buildNavigationBar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(20.0), // To adjust the button to not reach the edge or the bottom.
    child: MaterialButton( // (^2)
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.resultsPageScreen); // Method to navigate to Results Page.
      },
      color: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), // Adjusting the roundness of the edges.
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0), // Adjust this value to create more or less space vertically between the text.
        child: Text(
          'Select Ingredients',
          style: TextStyle(fontSize: 24),
        ),
      ),
    ),
  );
}






