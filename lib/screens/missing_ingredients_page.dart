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
                  ],
                  if (buttons.ingredients[15] != Colors.yellow) ...[
                    Text('Kanin'),
                  ],
                  if (buttons.ingredients[16] != Colors.yellow) ...[
                    Text('Green Papaya'),
                  ],
                  if (buttons.ingredients[17] != Colors.yellow) ...[
                    Text('Bawang'),
                  ],
                  if (buttons.ingredients[18] != Colors.yellow) ...[
                    Text('Luya'),
                  ],
                  if (buttons.ingredients[12] != Colors.yellow) ...[
                    Text('Toyo'),
                  ],
                  if (buttons.ingredients[20] != Colors.yellow) ...[
                    Text('Hot Pepper Leaves'),
                  ],
                  if (buttons.ingredients[21] != Colors.yellow) ...[
                    Text('Ground Black Pepper'),
                  ],
                ],
                if (buttons.getMyRecipe() == 'Tapsilog') ...[
                  if (buttons.ingredients[0] != Colors.yellow) ...[
                    Text('Beef'),
                  ],
                  if (buttons.ingredients[22] != Colors.yellow) ...[
                    Text('Itlog'),
                  ],
                  if (buttons.ingredients[23] != Colors.yellow) ...[
                    Text('Knorr Liquid Seasoning'),
                  ],
                  if (buttons.ingredients[24] != Colors.yellow) ...[
                    Text('Pineapple Juice'),
                  ],
                  if (buttons.ingredients[26] != Colors.yellow) ...[
                    Text('Pamintang Puti'),
                  ],
                  if (buttons.ingredients[14] != Colors.yellow) ...[
                    Text('Salt'),
                  ],
                  if (buttons.ingredients[17] != Colors.yellow) ...[
                    Text('Bawang'),
                  ],
                  if (buttons.ingredients[15] != Colors.yellow) ...[
                    Text('Kanin'),
                  ],
                  if (buttons.ingredients[25] != Colors.yellow) ...[
                    Text('Brown Sugar'),
                  ],
                ],

                if (buttons.getMyRecipe() == 'Cassava Cake') ...[
                  if (buttons.ingredients[27] != Colors.yellow) ...[
                    Text('Kamoteng Kahoy'),
                  ],
                  if (buttons.ingredients[28] != Colors.yellow) ...[
                    Text('Gata ng Niyog'),
                  ],
                  if (buttons.ingredients[29] != Colors.yellow) ...[
                    Text('Evaporated Milk'),
                  ],
                  if (buttons.ingredients[22] != Colors.yellow) ...[
                    Text('Itlog'),
                  ],
                  if (buttons.ingredients[30] != Colors.yellow) ...[
                    Text('Butter'),
                  ],
                  if (buttons.ingredients[31] != Colors.yellow) ...[
                    Text('Cheddar Cheese'),
                  ],
                  if (buttons.ingredients[32] != Colors.yellow) ...[
                    Text('Condensed Milk'),
                  ],
                  if (buttons.ingredients[33] != Colors.yellow) ...[
                    Text('White Sugar'),
                  ],
                  if (buttons.ingredients[34] != Colors.yellow) ...[
                    Text('Harina'),
                  ],
                ],

                if (buttons.getMyRecipe() == 'Menudo') ...[
                  if (buttons.ingredients[2] != Colors.yellow) ...[
                    Text('Baboy'),
                  ],
                  if (buttons.ingredients[35] != Colors.yellow) ...[
                    Text('Atay ng Baboy'),
                  ],
                  if (buttons.ingredients[4] != Colors.yellow) ...[
                    Text('Patatas'),
                  ],
                  if (buttons.ingredients[3] != Colors.yellow) ...[
                    Text('Carrot'),
                  ],
                  if (buttons.ingredients[12] != Colors.yellow) ...[
                    Text('Toyo'),
                  ],
                  if (buttons.ingredients[36] != Colors.yellow) ...[
                    Text('Lemon'),
                  ],
                  if (buttons.ingredients[13] != Colors.yellow) ...[
                    Text('Sibuyas'),
                  ],
                  if (buttons.ingredients[17] != Colors.yellow) ...[
                    Text('Garlic/Bawang'),
                  ],
                  if (buttons.ingredients[33] != Colors.yellow) ...[
                    Text('White Sugar'),
                  ],
                  if (buttons.ingredients[37] != Colors.yellow) ...[
                    Text('Tomato Sauce'),
                  ],
                  if (buttons.ingredients[38] != Colors.yellow) ...[
                    Text('Hotdog'),
                  ],
                  if (buttons.ingredients[39] != Colors.yellow) ...[
                    Text('Dried Bay Leaves'),
                  ],
                  if (buttons.ingredients[14] != Colors.yellow) ...[
                    Text('Salt'),
                  ],
                  if (buttons.ingredients[40] != Colors.yellow) ...[
                    Text('Pepper'),
                  ],
                ],

                if (buttons.getMyRecipe() == 'Bulalo') ...[
                  if (buttons.ingredients[0] != Colors.yellow) ...[
                    Text('Beef'),
                  ],
                  if (buttons.ingredients[41] != Colors.yellow) ...[
                    Text('Repolyo'),
                  ],
                  if (buttons.ingredients[42] != Colors.yellow) ...[
                    Text('Bok Choy'),
                  ],
                  if (buttons.ingredients[43] != Colors.yellow) ...[
                    Text('Mais'),
                  ],
                  if (buttons.ingredients[44] != Colors.yellow) ...[
                    Text('Black Pepper'),
                  ],
                  if (buttons.ingredients[45] != Colors.yellow) ...[
                    Text('Green Onions'),
                  ],
                  if (buttons.ingredients[13] != Colors.yellow) ...[
                    Text('Sibuyas'),
                  ],
                  if (buttons.ingredients[12] != Colors.yellow) ...[
                    Text('Toyo'),
                  ],
                ],

                if (buttons.getMyRecipe() == 'Lumpiang Shanghai') ...[
                  if (buttons.ingredients[46] != Colors.yellow) ...[
                    Text('Lumpia Wrapper'),
                  ],
                  if (buttons.ingredients[47] != Colors.yellow) ...[
                    Text('Ground Pork'),
                  ],
                  if (buttons.ingredients[2] != Colors.yellow) ...[
                    Text('Baboy'),
                  ],
                  if (buttons.ingredients[13] != Colors.yellow) ...[
                    Text('Sibuyas'),
                  ],
                  if (buttons.ingredients[3] != Colors.yellow) ...[
                    Text('Carrot'),
                  ],
                  if (buttons.ingredients[47] != Colors.yellow) ...[
                    Text('Garlic Powder'),
                  ],
                  if (buttons.ingredients[21] != Colors.yellow) ...[
                    Text('Ground Black Pepper'),
                  ],
                  if (buttons.ingredients[48] != Colors.yellow) ...[
                    Text('Parsley'),
                  ],
                  if (buttons.ingredients[49] != Colors.yellow) ...[
                    Text('Sesame Oil'),
                  ],
                  if (buttons.ingredients[14] != Colors.yellow) ...[
                    Text('Salt'),
                  ],
                  if (buttons.ingredients[22] != Colors.yellow) ...[
                    Text('Itlog'),
                  ],
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
  final buttons = context.read<ButtonsModel>();
  return Padding(
    padding: EdgeInsets.all(deviceSize.width * 0.05), // Use a percentage of the screen width
    child: MaterialButton(
      onPressed: () {

        if (buttons.getMyRecipe() == 'Tinola') {
          buttons.addToRecipeBank(buttons.getMyRecipe());
          if (buttons.ingredients[1] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Chicken');
          }
          if (buttons.ingredients[13] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Sibuyas');
          }
          if (buttons.ingredients[15] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Kanin');
          }
          if (buttons.ingredients[16] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Green Papaya');
          }
          if (buttons.ingredients[17] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Bawang');
          }
          if (buttons.ingredients[18] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Luya');
          }
          if (buttons.ingredients[12] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Toyo');
          }
          if (buttons.ingredients[20] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Hot Pepper Leaves');
          }
          if (buttons.ingredients[21] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Ground Black Pepper');
          }
        }

        if (buttons.getMyRecipe() == 'Tapsilog') {
          buttons.addToRecipeBank(buttons.getMyRecipe());
          if (buttons.ingredients[0] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Beef');
          }
          if (buttons.ingredients[22] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Itlog');
          }
          if (buttons.ingredients[23] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Knorr Liquid Seasoning');
          }
          if (buttons.ingredients[17] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Bawang');
          }
          if (buttons.ingredients[24] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Pineapple Juice');
          }
          if (buttons.ingredients[25] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Brown Sugar');
          }
          if (buttons.ingredients[26] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Pamintang Puti');
          }
          if (buttons.ingredients[14] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Salt');
          }
          if (buttons.ingredients[15] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Kanin');
          }
        }

        if (buttons.getMyRecipe() == 'Cassava Cake') {
          buttons.addToRecipeBank(buttons.getMyRecipe());
          if (buttons.ingredients[27] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Kamoteng Kahoy');
          }
          if (buttons.ingredients[28] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Gata ng Niyog');
          }
          if (buttons.ingredients[29] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Evaporated Milk');
          }
          if (buttons.ingredients[22] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Itlog');
          }
          if (buttons.ingredients[30] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Butter');
          }
          if (buttons.ingredients[31] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Cheddar Cheese');
          }
          if (buttons.ingredients[32] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Condensed Milk');
          }
          if (buttons.ingredients[33] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('White Sugar');
          }
          if (buttons.ingredients[34] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Harina');
          }
        }

        if (buttons.getMyRecipe() == 'Menudo') {
          buttons.addToRecipeBank(buttons.getMyRecipe());
          if (buttons.ingredients[2] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Baboy');
          }
          if (buttons.ingredients[35] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Atay ng Baboy');
          }
          if (buttons.ingredients[4] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Patatas');
          }
          if (buttons.ingredients[3] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Carrot');
          }
          if (buttons.ingredients[12] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Toyo');
          }
          if (buttons.ingredients[36] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Lemon');
          }
          if (buttons.ingredients[13] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Sibuyas');
          }
          if (buttons.ingredients[17] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Garlic/Bawang');
          }
          if (buttons.ingredients[33] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('White Sugar');
          }
          if (buttons.ingredients[37] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Tomato Sauce');
          }
          if (buttons.ingredients[38] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Hotdog');
          }
          if (buttons.ingredients[39] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Dried Bay Leaves');
          }
          if (buttons.ingredients[14] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Salt');
          }
          if (buttons.ingredients[40] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Pepper');
          }
        }

        if (buttons.getMyRecipe() == 'Bulalo') {
          buttons.addToRecipeBank(buttons.getMyRecipe());
          if (buttons.ingredients[0] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Beef');
          }
          if (buttons.ingredients[41] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Repolyo');
          }
          if (buttons.ingredients[42] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Bok Choy');
          }
          if (buttons.ingredients[43] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Mais');
          }
          if (buttons.ingredients[44] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Black Pepper');
          }
          if (buttons.ingredients[45] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Green Onions');
          }
          if (buttons.ingredients[13] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Sibuyas');
          }
          if (buttons.ingredients[12] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Toyo');
          }
        }

        if (buttons.getMyRecipe() == 'Lumpiang Shanghai') {
          buttons.addToRecipeBank(buttons.getMyRecipe());
          if (buttons.ingredients[46] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Lumpia Wrapper');
          }
          if (buttons.ingredients[47] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Ground Pork');
          }
          if (buttons.ingredients[2] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Baboy');
          }
          if (buttons.ingredients[13] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Sibuyas');
          }
          if (buttons.ingredients[3] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Carrot');
          }
          if (buttons.ingredients[47] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Garlic Powder');
          }
          if (buttons.ingredients[21] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Ground Black Pepper');
          }
          if (buttons.ingredients[48] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Parsley');
          }
          if (buttons.ingredients[49] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Sesame Oil');
          }
          if (buttons.ingredients[14] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Salt');
          }
          if (buttons.ingredients[22] != Colors.yellow) {
            buttons.addToMissingIngredientsBank('Itlog');
          }
        }


        Navigator.pushNamed(context, AppRoutes.shoppingListScreen);
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
