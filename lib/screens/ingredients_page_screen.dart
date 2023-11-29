/*

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
      padding: EdgeInsets.all(7), // Spacing
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
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredients'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Making Widget below it scrollable.
          child: Column(
            children: <Widget>[
              SizedBox(height: 30), // Adjust the height as needed
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // MainAxisAlignment.spaceBetween value means that the free space is evenly distributed between the children.
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20), // To adjust "Select Ingredients" Header away from the left side)
                    child: Text(
                      'Select Ingredients',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20), // To adjust "Clear" button away from the left side
                    child: ElevatedButton(
                      onPressed: () {
                        // Get the Buttons instance
                        final buttons = context.read<ButtonsModel>();

                        // Set all elements in filters and ingredients to Colors.white
                        buttons.clearFilters();
                        buttons.clearIngredients();
                      },
                      child: Text(
                        'Clear',
                        style: TextStyle(fontSize: 18), // Increase text size
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // background color
                        foregroundColor: Colors.black, // text color
                        // shadowColor: Colors.transparent, // shadow color
                        side: BorderSide(color: Colors.white, width: 0), // border color and width
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Adjust the height for empty space as needed
              _buildIngredientCategoryName(context, 'Meat'),
              Row( // List of Buttons per Row
                  children: <Widget>[
                    _buildIngredientButtons('Beef', 0),
                    _buildIngredientButtons('Chicken', 1),
                    _buildIngredientButtons('Pork', 2),
                    ],
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Vegetable'),
              Row( // List of Buttons per Row
                children: <Widget>[
                  _buildIngredientButtons('Carrot', 3),
                  _buildIngredientButtons('Potato', 4),
                  _buildIngredientButtons('Tomato', 5),
                  _buildIngredientButtons('Sibuyas', 13),
                ],
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Seafoods'),
              Row( // List of Buttons per Row
                children: <Widget>[
                  _buildIngredientButtons('Fish', 6),
                  _buildIngredientButtons('Shrimp', 7),
                  _buildIngredientButtons('Crab', 8),
                ],
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Seasonings & Spices'),
              Row( // List of Buttons per Row
                children: <Widget>[
                  _buildIngredientButtons('Salt', 14),
                ],
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Fruits'),
              Row( // List of Buttons per Row
                children: <Widget>[
                  _buildIngredientButtons('Apple', 9),
                  _buildIngredientButtons('Banana', 10),
                  _buildIngredientButtons('Orange', 11),
                ],
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Condiments'),
              Row( // List of Buttons per Row
                children: <Widget>[
                  _buildIngredientButtons('Toyo', 12),
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






