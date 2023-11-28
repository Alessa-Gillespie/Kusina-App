import 'package:flutter/material.dart';
import 'package:kusina_app_v3/routes//app_routes.dart'; // Import this to make the Navigation work.

// Import the provider packages
import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

class MissingIngredientsPage extends StatefulWidget {
  @override
  _MissingIngredientsPage createState() => _MissingIngredientsPage();
}

class _MissingIngredientsPage extends State<MissingIngredientsPage> {
  List<String> items = ['Apples', 'Bananas', 'Oranges'];

  @override
  Widget build(BuildContext context) {
    final buttons = context.read<ButtonsModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Missing Ingredients'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.shopping_cart, size: 90),
                if (buttons.getMyRecipe() == 'Tinola') ...[
                  if (buttons.ingredients[1] != Colors.yellow) ...[
                    Text('Chicken'),
                  ],
                  if (buttons.ingredients[13] != Colors.yellow) ...[
                    Text('Sibuyas'),
                  ]
                ],
                if (buttons.getMyRecipe() == 'Tapsilog') ...[
                  if (buttons.ingredients[14] != Colors.yellow) ...[
                    Text('Salt'),
                  ],
                  if (buttons.ingredients[12] != Colors.yellow) ...[
                    Text('Toyo'),
                  ]
                ],
                // Add more Text widgets here for additional strings
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }
}

Widget _buildNavigationBar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(20.0),
    // To adjust the button to not reach the edge or the bottom.
    child: MaterialButton( // (^2)
      onPressed: () {
        Navigator.pushNamed(context,
            AppRoutes.resultsPageScreen); // Method to navigate to Results Page.
      },
      color: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            30.0), // Adjusting the roundness of the edges.
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        // Adjust this value to create more or less space vertically between the text.
        child: Text(
          'Add To Shopping Cart',
          style: TextStyle(fontSize: 24),
        ),
      ),
    ),
  );
}
