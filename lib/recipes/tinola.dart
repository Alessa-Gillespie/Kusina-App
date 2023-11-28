import 'package:flutter/material.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';

// Import the provider packages
import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

class Tinola extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final buttons = context.read<ButtonsModel>();

// Get the value of myString

    String currentValue = buttons.getMyRecipe();

// Set the value of myString
    buttons.setMyRecipe('Tinola');

    return Scaffold(
      appBar: AppBar(
        title: Text('Temporary'),
      ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.missingIngredients);
            },
            child: Text('Shopping Tinola'),
          ),
        ),
    );
  }
}