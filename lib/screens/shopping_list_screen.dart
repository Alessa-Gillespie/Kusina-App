import 'package:flutter/material.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';
import 'package:kusina_app_v3/navbar.dart';
import 'package:kusina_app_v3/styles.dart';

// Import the provider packages
import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

class ShoppingList extends StatefulWidget {
  @override
  _shoppingListState createState() => _shoppingListState();
}

class _shoppingListState extends State<ShoppingList> {
  bool _shoppingListIsEmpty = true; //depends sa "database" ng shopping list and controls the display of _buildEmptySection()
                                      //NOTE: this bool is just a placeholder variable
  Widget _buildEmptySection(){
    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.folder_rounded,
              color: kEmptyPageTextColor,
              size: 100,
            ),
            Text(
              'You haven\'t added your\nfavorites yet',
              textAlign: TextAlign.center,
              style: kEmptyPageTextTextStyle,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final deviceSize = MediaQuery.of(context).size; // Get the size of the device
    final buttons = context.read<ButtonsModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: SafeArea(
        child: _shoppingListIsEmpty
                ? _buildEmptySection() //displays empty section
                : SingleChildScrollView( //displays the contents of shopping list
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 30),
                      if (buttons.isRecipeInBank('Tinola')) ...[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Tinola',
                                        style: TextStyle(
                                            fontSize: 40.0,
                                            // change this value to change the size
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20), // To adjust "Clear" button away from the left side
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Get the Buttons instance
                                          final buttons = context.read<ButtonsModel>();

                                          // Set all elements in filters and ingredients to Colors.white
                                          buttons.removeFromRecipeBank('Tinola');
                                          buttons.removeFromMissingIngredientsBank('Chicken');
                                          buttons.removeFromMissingIngredientsBank('Sibuyas');
                                          Navigator.pushNamed(context, AppRoutes.shoppingListScreen);
                                        },
                                        child: Text(
                                          'Remove',
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

                                  ]),
                              Row(children: <Widget>[
                                if (buttons.isIngredientMissing('Chicken')) ...[
                                  Text('Chicken', style: TextStyle(fontSize: 18)),
                                ],
                                if (buttons.isIngredientMissing('Sibuyas')) ...[
                                  Text('Sibuyas', style: TextStyle(fontSize: 18)),
                                ],
                              ]),
                            ],
                          ),
                        ),
                      ],

                      if (buttons.isRecipeInBank('Tapsilog')) ...[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Tapsilog',
                                        style: TextStyle(
                                            fontSize: 40.0,
                                            // change this value to change the size
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20), // To adjust "Clear" button away from the left side
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Get the Buttons instance
                                          final buttons = context.read<ButtonsModel>();

                                          // Set all elements in filters and ingredients to Colors.white
                                          buttons.removeFromRecipeBank('Tapsilog');
                                          buttons.removeFromMissingIngredientsBank('Salt');
                                          buttons.removeFromMissingIngredientsBank('Toyo');
                                          Navigator.pushNamed(context, AppRoutes.shoppingListScreen);
                                        },
                                        child: Text(
                                          'Remove',
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
                                  ]),
                              Row(
                                children: <Widget>[
                                  if (buttons.isIngredientMissing('Salt')) ...[
                                    Text('Salt', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Toyo')) ...[
                                    Text('Toyo', style: TextStyle(fontSize: 18)),
                                  ],
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
