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

  @override
  Widget build(BuildContext context) {
    final buttons = context.read<ButtonsModel>();
    final deviceSize = MediaQuery.of(context).size; // Get the size of the device

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
                Icon(Icons.shopping_cart, size: deviceSize.width * 0.2), // Use a percentage of the screen width
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
      bottomNavigationBar: _buildNavigationBar(context, deviceSize),
    );
  }
}

Widget _buildNavigationBar(BuildContext context, Size deviceSize) {
  return Padding(
    padding: EdgeInsets.all(deviceSize.width * 0.05), // Use a percentage of the screen width
    child: MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.resultsPageScreen);
      },
      color: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(deviceSize.width * 0.075), // Use a percentage of the screen width
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: deviceSize.height * 0.01), // Use a percentage of the screen height
        child: Text(
          'Add To Shopping Cart',
          style: TextStyle(fontSize: deviceSize.width * 0.06), // Use a percentage of the screen width
        ),
      ),
    ),
  );
}
