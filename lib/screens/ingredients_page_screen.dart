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
                    children: _buildIngredientButtons(context, ['Beef', 'Chicken', 'Pork']),
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Vegetable'),
              Row( // List of Buttons per Row
                children: _buildIngredientButtons(context, ['Carrot', 'Potato', 'Tomato']),
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Seafoods'),
              Row( // List of Buttons per Row
                children: _buildIngredientButtons(context, ['Fish', 'Shrimp', 'Crab']),
              ),
              SizedBox(height: 30),
              _buildIngredientCategoryName(context, 'Fruits'),
              Row( // List of Buttons per Row
                children: _buildIngredientButtons(context, ['Apple', 'Banana', 'Orange']),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }
}

List<Widget> _buildIngredientButtons(BuildContext context, List<String> items) { // Takes a list of Strings.
  return items.map((item) => Row(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 15),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Implement item button functionality
          },
          child: Text(item), // Name of the ingredient
        ),
      ),
    ],
  )).toList();
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




