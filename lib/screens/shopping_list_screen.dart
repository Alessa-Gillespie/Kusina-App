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
        automaticallyImplyLeading: false,
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
                      if (buttons.isRecipeInBank('Tinola')) ...[
                        Container(
                          color: Colors.white,
                          child: Padding(
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
                                    Row(
                                      children: [
                                        Text('Chicken', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ],
                                  if (buttons.isIngredientMissing('Sibuyas')) ...[
                                    Row(
                                      children: [
                                        Text('Sibuyas', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ],
                                  if (buttons.isIngredientMissing('Kanin')) ...[
                                    Row(
                                      children: [
                                        Text('Kanin', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ],
                                  if (buttons.isIngredientMissing('Green Papaya')) ...[
                                    Row(
                                      children: [
                                        Text('Green Papaya', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ],
                                  if (buttons.isIngredientMissing('Bawang')) ...[
                                    Row(
                                      children: [
                                        Text('Bawang', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ],
                                  if (buttons.isIngredientMissing('Luya')) ...[
                                    Row(
                                      children: [
                                        Text('Luya', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ],
                                  if (buttons.isIngredientMissing('Toyo')) ...[
                                    Row(
                                      children: [
                                        Text('Toyo', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ],
                                  if (buttons.isIngredientMissing('Hot Pepper Leaves')) ...[
                                    Row(
                                      children: [
                                        Text('Hot Pepper Leaves', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ],
                                  if (buttons.isIngredientMissing('Ground Black Pepper')) ...[
                                    Row(
                                      children: [
                                        Text('Ground Black Pepper', style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ],
                                ]),
                              ],
                            ),
                          ),
                        ),
                      ],

                      if (buttons.isRecipeInBank('Tapsilog')) ...[
                        Container(
                          color: Colors.white,
                          child: Padding(
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
                                      Row(
                                        children: [
                                          Text('Beef', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Itlog')) ...[
                                      Row(
                                        children: [
                                          Text('Itlog', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Knorr Liquid Seasoning')) ...[
                                      Row(
                                        children: [
                                          Text('Knorr Liquid Seasoning', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Bawang')) ...[
                                      Row(
                                        children: [
                                          Text('Garlic/Bawang', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Pineapple Juice')) ...[
                                      Row(
                                        children: [
                                          Text('Pineapple Juice', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Brown Sugar')) ...[
                                      Row(
                                        children: [
                                          Text('Brown Sugar', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Pamintang Puti')) ...[
                                      Row(
                                        children: [
                                          Text('Pamintang Puti', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Salt')) ...[
                                      Row(
                                        children: [
                                          Text('Salt', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Kanin')) ...[
                                      Row(
                                        children: [
                                          Text('Kanin', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                      if (buttons.isRecipeInBank('Cassava Cake')) ...[
                        Container(
                          color: Colors.white,
                          child: Padding(
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
                                      Row(
                                        children: [
                                          Text('Kamoteng Kahoy', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Gata ng Niyog')) ...[
                                      Row(
                                        children: [
                                          Text('Gata ng Niyog', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Evaporated Milk')) ...[
                                      Row(
                                        children: [
                                          Text('Evaporated Milk', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Itlog')) ...[
                                      Row(
                                        children: [
                                          Text('Itlog', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Butter')) ...[
                                      Row(
                                        children: [
                                          Text('Butter', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Cheddar Cheese')) ...[
                                      Row(
                                        children: [
                                          Text('Cheddar Cheese', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Condensed Milk')) ...[
                                      Row(
                                        children: [
                                          Text('Condensed Milk', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('White Sugar')) ...[
                                      Row(
                                        children: [
                                          Text('White Sugar', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Harina')) ...[
                                      Row(
                                        children: [
                                          Text('Harina', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                      if (buttons.isRecipeInBank('Menudo')) ...[
                        Container(
                          color: Colors.white,
                          child: Padding(
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
                                            buttons.removeFromMissingIngredientsBank('Bawang');
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
                                      Row(
                                        children: [
                                          Text('Baboy', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Atay ng Baboy')) ...[
                                      Row(
                                        children: [
                                          Text('Atay ng Baboy', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Patatas')) ...[
                                      Row(
                                        children: [
                                          Text('Patatas', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Carrot')) ...[
                                      Row(
                                        children: [
                                          Text('Carrot', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Toyo')) ...[
                                      Row(
                                        children: [
                                          Text('Toyo', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Lemon')) ...[
                                      Row(
                                        children: [
                                          Text('Lemon', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Sibuyas')) ...[
                                      Row(
                                        children: [
                                          Text('Sibuyas', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Bawang')) ...[
                                      Row(
                                        children: [
                                          Text('Garlic/Bawang', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('White Sugar')) ...[
                                      Row(
                                        children: [
                                          Text('White Sugar', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Tomato Sauce')) ...[
                                      Row(
                                        children: [
                                          Text('Tomato Sauce', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Hotdog')) ...[
                                      Row(
                                        children: [
                                          Text('Hotdog', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Dried Bay Leaves')) ...[
                                      Row(
                                        children: [
                                          Text('Dried Bay Leaves', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Salt')) ...[
                                      Row(
                                        children: [
                                          Text('Salt', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Pepper')) ...[
                                      Row(
                                        children: [
                                          Text('Pepper', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                      if (buttons.isRecipeInBank('Bulalo')) ...[
                        Container(
                          color: Colors.white,
                          child: Padding(
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
                                      Row(
                                        children: [
                                          Text('Beef', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Repolyo')) ...[
                                      Row(
                                        children: [
                                          Text('Repolyo', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Bok Choy')) ...[
                                      Row(
                                        children: [
                                          Text('Bok Choy', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Mais')) ...[
                                      Row(
                                        children: [
                                          Text('Mais', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Black Pepper')) ...[
                                      Row(
                                        children: [
                                          Text('Black Pepper', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Green Onions')) ...[
                                      Row(
                                        children: [
                                          Text('Green Onions', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Sibuyas')) ...[
                                      Row(
                                        children: [
                                          Text('Sibuyas', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Toyo')) ...[
                                      Row(
                                        children: [
                                          Text('Toyo', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                      if (buttons.isRecipeInBank('Lumpiang Shanghai')) ...[
                        Container(
                          color: Colors.white,
                          child: Padding(
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
                                      Row(
                                        children: [
                                          Text('Lumpia Wrapper', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Ground Pork')) ...[
                                      Row(
                                        children: [
                                          Text('Ground Pork', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Baboy')) ...[
                                      Row(
                                        children: [
                                          Text('Baboy', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Sibuyas')) ...[
                                      Row(
                                        children: [
                                          Text('Sibuyas', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Carrot')) ...[
                                      Row(
                                        children: [
                                          Text('Carrot', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Garlic Powder')) ...[
                                      Row(
                                        children: [
                                          Text('Garlic Powder', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Ground Black Pepper')) ...[
                                      Row(
                                        children: [
                                          Text('Ground Black Pepper', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Parsley')) ...[
                                      Row(
                                        children: [
                                          Text('Parsley', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Sesame Oil')) ...[
                                      Row(
                                        children: [
                                          Text('Sesame Oil', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Salt')) ...[
                                      Row(
                                        children: [
                                          Text('Salt', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Itlog')) ...[
                                      Row(
                                        children: [
                                          Text('Itlog', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                      if (buttons.isRecipeInBank('Champorado')) ...[
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Champorado',
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
                                            buttons.removeFromRecipeBank('Champorado');
                                            buttons.removeFromMissingIngredientsBank('Cocoa Powder');
                                            buttons.removeFromMissingIngredientsBank('Kaning Malagkit');
                                            buttons.removeFromMissingIngredientsBank('Tubig');
                                            buttons.removeFromMissingIngredientsBank('White Sugar');
                                            buttons.removeFromMissingIngredientsBank('Condensed Milk');
                                            buttons.removeFromMissingIngredientsBank('Evaporated Milk');
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
                                    if (buttons.isIngredientMissing('Cocoa Powder')) ...[
                                      Row(
                                        children: [
                                          Text('Cocoa Powder', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Kaning Malagkit')) ...[
                                      Row(
                                        children: [
                                          Text('Kaning Malagkit', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Water/Tubig')) ...[
                                      Row(
                                        children: [
                                          Text('Water/Tubig', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('White Sugar')) ...[
                                      Row(
                                        children: [
                                          Text('White Sugar', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Condensed Milk')) ...[
                                      Row(
                                        children: [
                                          Text('Condensed Milk', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Evaporated Milk')) ...[
                                      Row(
                                        children: [
                                          Text('Evaporated Milk', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                      if (buttons.isRecipeInBank('Daing')) ...[
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Daing',
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
                                            buttons.removeFromRecipeBank('Daing');
                                            buttons.removeFromMissingIngredientsBank('Bangus');
                                            buttons.removeFromMissingIngredientsBank('Suka');
                                            buttons.removeFromMissingIngredientsBank('Black Pepper');
                                            buttons.removeFromMissingIngredientsBank('Bawang');
                                            buttons.removeFromMissingIngredientsBank('Cayenne Pepper Powder');
                                            buttons.removeFromMissingIngredientsBank('Sea Salt');
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
                                    if (buttons.isIngredientMissing('Bangus')) ...[
                                      Row(
                                        children: [
                                          Text('Bangus', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Suka')) ...[
                                      Row(
                                        children: [
                                          Text('Suka', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Black Pepper')) ...[
                                      Row(
                                        children: [
                                          Text('Black Pepper', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Bawang')) ...[
                                      Row(
                                        children: [
                                          Text('Garlic/Bawang', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Cayenne Pepper Powder')) ...[
                                      Row(
                                        children: [
                                          Text('Cayenne Pepper Powder', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Sea Salt')) ...[
                                      Row(
                                        children: [
                                          Text('Sea Salt', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                      if (buttons.isRecipeInBank('Tuyo')) ...[
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Tuyo',
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
                                            buttons.removeFromRecipeBank('Tuyo');
                                            buttons.removeFromMissingIngredientsBank('Tuyo Salted Dried Fish');
                                            buttons.removeFromMissingIngredientsBank('Kanin');
                                            buttons.removeFromMissingIngredientsBank('Kamatis');
                                            buttons.removeFromMissingIngredientsBank('Suka');
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
                                    if (buttons.isIngredientMissing('Tuyo Salted Dried Fish')) ...[
                                      Row(
                                        children: [
                                          Text('Tuyo Salted Dried Fish', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Kanin')) ...[
                                      Row(
                                        children: [
                                          Text('Kanin', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Kamatis')) ...[
                                      Row(
                                        children: [
                                          Text('Kamatis', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Suka')) ...[
                                      Row(
                                        children: [
                                          Text('Suka', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],

                      if (buttons.isRecipeInBank('Omelet')) ...[
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Omelet',
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
                                            buttons.removeFromRecipeBank('Omelet');
                                            buttons.removeFromMissingIngredientsBank('Red Onion');
                                            buttons.removeFromMissingIngredientsBank('Itlog');
                                            buttons.removeFromMissingIngredientsBank('Kamatis');
                                            buttons.removeFromMissingIngredientsBank('Black Pepper');
                                            buttons.removeFromMissingIngredientsBank('Sea Salt');
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
                                    if (buttons.isIngredientMissing('Red Onion')) ...[
                                      Row(
                                        children: [
                                          Text('Red Onion', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Itlog')) ...[
                                      Row(
                                        children: [
                                          Text('Itlog', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Kamatis')) ...[
                                      Row(
                                        children: [
                                          Text('Kamatis', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Black Pepper')) ...[
                                      Row(
                                        children: [
                                          Text('Black Pepper', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                    if (buttons.isIngredientMissing('Sea Salt')) ...[
                                      Row(
                                        children: [
                                          Text('Sea Salt', style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ],
                                  ],
                                )
                              ],
                            ),
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
