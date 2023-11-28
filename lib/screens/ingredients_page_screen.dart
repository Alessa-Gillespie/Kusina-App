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

 */

import 'package:flutter/material.dart';
import 'package:kusina_app_v3/routes//app_routes.dart'; // Import this to make the Navigation work.

class IngredientsPageScreen extends StatefulWidget {
  @override
  _ingredientsPageScreenState createState() => _ingredientsPageScreenState();
}

class _ingredientsPageScreenState extends State<IngredientsPageScreen> {
 // GlobalKey<NavigatorState> navigatorKey = GlobalKey(); (Ignore for now)
  // const _ingredientsPageScreenState({Key? key}) : super(key: key); // (^1) (Ignore for now)

  @override
  Widget build(BuildContext context) {
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
                    padding: EdgeInsets.only(right: 20), // To adjust "Clear" button away from the left side)
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement clear button functionality
                      },
                      child: Text('Clear'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Adjust the height for empty space as needed
              _buildIngredientCategoryName(context, 'Meat'),
              Row( // List of Buttons per Row
                    children: _buildIngredientButtons(context, ['Beef', 'Chicken', 'Pork'], [1, 2, 3]),
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Vegetable'),
              Row( // List of Buttons per Row
                children: _buildIngredientButtons(context, ['Carrot', 'Potato', 'Tomato'], [4, 5, 6]),
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Seafoods'),
              Row( // List of Buttons per Row
                children: _buildIngredientButtons(context, ['Fish', 'Shrimp', 'Crab'], [7, 8, 9]),
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Fruits'),
              Row( // List of Buttons per Row
                children: _buildIngredientButtons(context, ['Apple', 'Banana', 'Orange'], [10, 11, 12]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }
}

List<Widget> _buildIngredientButtons(BuildContext context, List<String> items, List<int> indices) { // Takes a list of Strings and a list of integers.
  return items.asMap().entries.map((entry) {
    int index = entry.key;
    String item = entry.value;
    int customIndex = indices[index]; // Get the custom index from the indices list

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: ElevatedButton(
            onPressed: () {
              print('Button $item at index $customIndex is pressed.');
            },
            child: Text('$item ($customIndex)'), // Name of the ingredient with its custom index
          ),
        ),
      ],
    );
  }).toList();
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
        Navigator.pushNamed(context, AppRoutes.homePage); // Method to navigate to Results Page.
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




