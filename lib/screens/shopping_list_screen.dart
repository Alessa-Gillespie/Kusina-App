import 'package:flutter/material.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';

// Import the provider packages
import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

class ShoppingList extends StatefulWidget {
  @override
  _shoppingListState createState() => _shoppingListState();
}

class _shoppingListState extends State<ShoppingList> {

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size; // Get the size of the device
    final buttons = context.read<ButtonsModel>();

    String currentValue = buttons.getMyRecipe();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (buttons.isRecipeInBank('Tinola')) ...[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    if (buttons.isIngredientMissing('Chicken')) ...[
                      Text('Chicken'),
                    ],
                    if (buttons.isIngredientMissing('Sibuyas')) ...[
                      Text('Sibuyas'),
                    ],
                  ],
                ),
              ),
            ),
          ],
          if (buttons.isRecipeInBank('Tapsilog')) ...[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    if (buttons.isIngredientMissing('Salt')) ...[
                      Text('Salt'),
                    ],
                    if (buttons.isIngredientMissing('Toyo')) ...[
                      Text('Toyo'),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}