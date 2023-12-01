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
              Icons.shopping_cart_rounded,
              color: kEmptyPageTextColor,
              size: 100,
            ),
            Text(
              'Your shopping list is empty',
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
      // final buttons = context.read<ButtonsModel>();
        child: context.read<ButtonsModel>().isRecipeBankEmpty()
                ? _buildEmptySection() //displays empty section
                : SingleChildScrollView( //displays the contents of shopping list
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 50),
                      Text('Shopping List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                                          buttons.removeFromMissingIngredientsBank('Kanin');
                                          buttons.removeFromMissingIngredientsBank('Green Papaya');
                                          buttons.removeFromMissingIngredientsBank('Bawang');
                                          buttons.removeFromMissingIngredientsBank('Luya');
                                          buttons.removeFromMissingIngredientsBank('Toyo');
                                          buttons.removeFromMissingIngredientsBank('Hot Pepper Leaves');
                                          buttons.removeFromMissingIngredientsBank('Ground Black Pepper');
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
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                if (buttons.isIngredientMissing('Chicken')) ...[
                                  Text('Chicken', style: TextStyle(fontSize: 18)),
                                ],
                                if (buttons.isIngredientMissing('Sibuyas')) ...[
                                  Text('Sibuyas', style: TextStyle(fontSize: 18)),
                                ],
                                if (buttons.isIngredientMissing('Kanin')) ...[
                                  Text('Kanin', style: TextStyle(fontSize: 18)),
                                ],
                                if (buttons.isIngredientMissing('Green Papaya')) ...[
                                  Text('Green Papaya', style: TextStyle(fontSize: 18)),
                                ],
                                if (buttons.isIngredientMissing('Bawang')) ...[
                                  Text('Bawang', style: TextStyle(fontSize: 18)),
                                ],
                                if (buttons.isIngredientMissing('Luya')) ...[
                                  Text('Luya', style: TextStyle(fontSize: 18)),
                                ],
                                if (buttons.isIngredientMissing('Toyo')) ...[
                                  Text('Toyo', style: TextStyle(fontSize: 18)),
                                ],
                                if (buttons.isIngredientMissing('Hot Pepper Leaves')) ...[
                                  Text('Hot Pepper Leaves', style: TextStyle(fontSize: 18)),
                                ],
                                if (buttons.isIngredientMissing('Ground Black Pepper')) ...[
                                  Text('Ground Black Pepper', style: TextStyle(fontSize: 18)),
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
                                          buttons.removeFromMissingIngredientsBank('Beef');
                                          buttons.removeFromMissingIngredientsBank('Itlog');
                                          buttons.removeFromMissingIngredientsBank('Knorr Liquid Seasoning');
                                          buttons.removeFromMissingIngredientsBank('Bawang');
                                          buttons.removeFromMissingIngredientsBank('Pineapple Juice');
                                          buttons.removeFromMissingIngredientsBank('Brown Sugar');
                                          buttons.removeFromMissingIngredientsBank('Pamintang Puti');
                                          buttons.removeFromMissingIngredientsBank('Salt');
                                          buttons.removeFromMissingIngredientsBank('Kanin');
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
                              Column(
                                children: <Widget>[
                                  if (buttons.isIngredientMissing('Beef')) ...[
                                    Text('Beef', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Itlog')) ...[
                                    Text('Itlog', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Knorr Liquid Seasoning')) ...[
                                    Text('Knorr Liquid Seasoning', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Garlic/Bawang')) ...[
                                    Text('Garlic/Bawang', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Pineapple Juice')) ...[
                                    Text('Pineapple Juice', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Brown Sugar')) ...[
                                    Text('Brown Sugar', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Pamintang Puti')) ...[
                                    Text('Pamintang Puti', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Salt')) ...[
                                    Text('Salt', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Kanin')) ...[
                                    Text('Kanin', style: TextStyle(fontSize: 18)),
                                  ],
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                      if (buttons.isRecipeInBank('Cassava Cake')) ...[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Cassava Cake',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            // change this value to change the size
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20), // To adjust "Clear" button away from the left side
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Get the Buttons instance
                                          final buttons = context.read<ButtonsModel>();

                                          // Set all elements in filters and ingredients to Colors.white
                                          buttons.removeFromRecipeBank('Cassava Cake');
                                          buttons.removeFromMissingIngredientsBank('Kamoteng Kahoy');
                                          buttons.removeFromMissingIngredientsBank('Gata ng Niyog');
                                          buttons.removeFromMissingIngredientsBank('Evaporated Milk');
                                          buttons.removeFromMissingIngredientsBank('Itlog');
                                          buttons.removeFromMissingIngredientsBank('Butter');
                                          buttons.removeFromMissingIngredientsBank('Cheddar Cheese');
                                          buttons.removeFromMissingIngredientsBank('Condensed Milk');
                                          buttons.removeFromMissingIngredientsBank('White Sugar');
                                          buttons.removeFromMissingIngredientsBank('Harina');
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
                              Column(
                                children: <Widget>[
                                  if (buttons.isIngredientMissing('Kamoteng Kahoy')) ...[
                                    Text('Kamoteng Kahoy', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Gata ng Niyog')) ...[
                                    Text('Gata ng Niyog', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Evaporated Milk')) ...[
                                    Text('Evaporated Milk', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Itlog')) ...[
                                    Text('Itlog', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Butter')) ...[
                                    Text('Butter', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Cheddar Cheese')) ...[
                                    Text('Cheddar Cheese', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Condensed Milk')) ...[
                                    Text('Condensed Milk', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('White Sugar')) ...[
                                    Text('White Sugar', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Harina')) ...[
                                    Text('Harina', style: TextStyle(fontSize: 18)),
                                  ],
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                      if (buttons.isRecipeInBank('Menudo')) ...[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Menudo',
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
                                          buttons.removeFromRecipeBank('Menudo');
                                          buttons.removeFromMissingIngredientsBank('Baboy');
                                          buttons.removeFromMissingIngredientsBank('Atay ng Baboy');
                                          buttons.removeFromMissingIngredientsBank('Patatas');
                                          buttons.removeFromMissingIngredientsBank('Carrot');
                                          buttons.removeFromMissingIngredientsBank('Toyo');
                                          buttons.removeFromMissingIngredientsBank('Lemon');
                                          buttons.removeFromMissingIngredientsBank('Sibuyas');
                                          buttons.removeFromMissingIngredientsBank('Garlic/Bawang');
                                          buttons.removeFromMissingIngredientsBank('White Sugar');
                                          buttons.removeFromMissingIngredientsBank('Tomato Sauce');
                                          buttons.removeFromMissingIngredientsBank('Hotdog');
                                          buttons.removeFromMissingIngredientsBank('Dried Bay Leaves');
                                          buttons.removeFromMissingIngredientsBank('Salt');
                                          buttons.removeFromMissingIngredientsBank('Pepper');
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
                              Column(
                                children: <Widget>[
                                  if (buttons.isIngredientMissing('Baboy')) ...[
                                    Text('Baboy', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Atay ng Baboy')) ...[
                                    Text('Atay ng Baboy', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Patatas')) ...[
                                    Text('Patatas', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Carrot')) ...[
                                    Text('Carrot', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Toyo')) ...[
                                    Text('Toyo', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Lemon')) ...[
                                    Text('Lemon', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Sibuyas')) ...[
                                    Text('Sibuyas', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Garlic/Bawang')) ...[
                                    Text('Garlic/Bawang', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('White Sugar')) ...[
                                    Text('White Sugar', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Tomato Sauce')) ...[
                                    Text('Tomato Sauce', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Hotdog')) ...[
                                    Text('Hotdog', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Dried Bay Leaves')) ...[
                                    Text('Dried Bay Leaves', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Salt')) ...[
                                    Text('Salt', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Pepper')) ...[
                                    Text('Pepper', style: TextStyle(fontSize: 18)),
                                  ],
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                      if (buttons.isRecipeInBank('Bulalo')) ...[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Bulalo',
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
                                          buttons.removeFromRecipeBank('Bulalo');
                                          buttons.removeFromMissingIngredientsBank('Beef');
                                          buttons.removeFromMissingIngredientsBank('Repolyo');
                                          buttons.removeFromMissingIngredientsBank('Bok Choy');
                                          buttons.removeFromMissingIngredientsBank('Mais');
                                          buttons.removeFromMissingIngredientsBank('Black Pepper');
                                          buttons.removeFromMissingIngredientsBank('Green Onions');
                                          buttons.removeFromMissingIngredientsBank('Sibuyas');
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
                              Column(
                                children: <Widget>[
                                  if (buttons.isIngredientMissing('Beef')) ...[
                                    Text('Beef', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Repolyo')) ...[
                                    Text('Repolyo', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Bok Choy')) ...[
                                    Text('Bok Choy', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Mais')) ...[
                                    Text('Mais', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Black Pepper')) ...[
                                    Text('Black Pepper', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Green Onions')) ...[
                                    Text('Green Onions', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Sibuyas')) ...[
                                    Text('Sibuyas', style: TextStyle(fontSize: 18)),
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
                      if (buttons.isRecipeInBank('Lumpiang Shanghai')) ...[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Lumpiang Shanghai',
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            // change this value to change the size
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20), // To adjust "Clear" button away from the left side
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Get the Buttons instance
                                          final buttons = context.read<ButtonsModel>();

                                          // Set all elements in filters and ingredients to Colors.white
                                          buttons.removeFromRecipeBank('Lumpiang Shanghai');
                                          buttons.removeFromMissingIngredientsBank('Lumpia Wrapper');
                                          buttons.removeFromMissingIngredientsBank('Ground Pork');
                                          buttons.removeFromMissingIngredientsBank('Baboy');
                                          buttons.removeFromMissingIngredientsBank('Sibuyas');
                                          buttons.removeFromMissingIngredientsBank('Carrot');
                                          buttons.removeFromMissingIngredientsBank('Garlic Powder');
                                          buttons.removeFromMissingIngredientsBank('Ground Black Pepper');
                                          buttons.removeFromMissingIngredientsBank('Parsley');
                                          buttons.removeFromMissingIngredientsBank('Sesame Oil');
                                          buttons.removeFromMissingIngredientsBank('Salt');
                                          buttons.removeFromMissingIngredientsBank('Itlog');
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
                              Column(
                                children: <Widget>[
                                  if (buttons.isIngredientMissing('Lumpia Wrapper')) ...[
                                    Text('Lumpia Wrapper', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Ground Pork')) ...[
                                    Text('Ground Pork', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Baboy')) ...[
                                    Text('Baboy', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Sibuyas')) ...[
                                    Text('Sibuyas', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Carrot')) ...[
                                    Text('Carrot', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Garlic Powder')) ...[
                                    Text('Garlic Powder', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Ground Black Pepper')) ...[
                                    Text('Ground Black Pepper', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Parsley')) ...[
                                    Text('Parsley', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Sesame Oil')) ...[
                                    Text('Sesame Oil', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Salt')) ...[
                                    Text('Salt', style: TextStyle(fontSize: 18)),
                                  ],
                                  if (buttons.isIngredientMissing('Itlog')) ...[
                                    Text('Itlog', style: TextStyle(fontSize: 18)),
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


      bottomNavigationBar: NavBar(
        selectedIndex: 2,
      ),
    );
  }
}
