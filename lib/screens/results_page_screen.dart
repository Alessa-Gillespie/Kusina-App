//commented out Recipe Block (properties are changed. go to recipe_block.dart to see)
import 'package:flutter/material.dart';
import 'package:kusina_app_v3/navbar.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/button_components.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';

// Import the provider packages
import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

const spaceBetweenTextAndBlock = 17;

const spaceBetweenRecipeBlocks = 18;

class ResultsPageScreen extends StatefulWidget {
  @override
  resultsPageScreenState createState() => resultsPageScreenState();
}

class resultsPageScreenState extends State<ResultsPageScreen> {

  int countRecipes(BuildContext context) {
    int count = 0;
    ButtonsModel buttons = Provider.of<ButtonsModel>(context, listen: false);

    if ((buttons.ingredients[1] == Colors.yellow
        || buttons.ingredients[15] == Colors.yellow
        || buttons.ingredients[16] == Colors.yellow
        || buttons.ingredients[17] == Colors.yellow
        || buttons.ingredients[13] == Colors.yellow
        || buttons.ingredients[18] == Colors.yellow
        || buttons.ingredients[12] == Colors.yellow
        || buttons.ingredients[20] == Colors.yellow
        || buttons.ingredients[21] == Colors.yellow)
        && (buttons.filters[0] != Colors.black && buttons.filters[3] != Colors.black)) {
      count++;
    }

    if ((buttons.ingredients[0] == Colors.yellow
        || buttons.ingredients[22] == Colors.yellow
        || buttons.ingredients[23] == Colors.yellow
        || buttons.ingredients[17] == Colors.yellow
        || buttons.ingredients[24] == Colors.yellow
        || buttons.ingredients[25] == Colors.yellow
        || buttons.ingredients[26] == Colors.yellow
        || buttons.ingredients[14] == Colors.yellow
        || buttons.ingredients[15] == Colors.yellow)
        && (buttons.filters[1] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black)) {
      count++;
    }

    if ((buttons.ingredients[27] == Colors.yellow
        || buttons.ingredients[28] == Colors.yellow
        || buttons.ingredients[29] == Colors.yellow
        || buttons.ingredients[22] == Colors.yellow
        || buttons.ingredients[30] == Colors.yellow
        || buttons.ingredients[31] == Colors.yellow
        || buttons.ingredients[32] == Colors.yellow
        || buttons.ingredients[33] == Colors.yellow
        || buttons.ingredients[34] == Colors.yellow)
        && (buttons.filters[1] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[0] != Colors.black)) {
      count++;
    }

    if ((buttons.ingredients[2] == Colors.yellow
        || buttons.ingredients[35] == Colors.yellow
        || buttons.ingredients[4] == Colors.yellow
        || buttons.ingredients[3] == Colors.yellow
        || buttons.ingredients[12] == Colors.yellow
        || buttons.ingredients[36] == Colors.yellow
        || buttons.ingredients[13] == Colors.yellow
        || buttons.ingredients[17] == Colors.yellow
        || buttons.ingredients[33] == Colors.yellow
        || buttons.ingredients[37] == Colors.yellow
        || buttons.ingredients[38] == Colors.yellow
        || buttons.ingredients[39] == Colors.yellow
        || buttons.ingredients[14] == Colors.yellow
        || buttons.ingredients[40] == Colors.yellow)
        && (buttons.filters[0] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black)) {
      count++;
    }

    if ((buttons.ingredients[0] == Colors.yellow
        || buttons.ingredients[41] == Colors.yellow
        || buttons.ingredients[42] == Colors.yellow
        || buttons.ingredients[43] == Colors.yellow
        || buttons.ingredients[44] == Colors.yellow
        || buttons.ingredients[45] == Colors.yellow
        || buttons.ingredients[13] == Colors.yellow
        || buttons.ingredients[12] == Colors.yellow) && (buttons.filters[0] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black)) {
      count++;
    }

    if ((buttons.ingredients[46] == Colors.yellow
        || buttons.ingredients[47] == Colors.yellow
        || buttons.ingredients[2] == Colors.yellow
        || buttons.ingredients[13] == Colors.yellow
        || buttons.ingredients[3] == Colors.yellow
        || buttons.ingredients[47] == Colors.yellow
        || buttons.ingredients[21] == Colors.yellow
        || buttons.ingredients[48] == Colors.yellow
        || buttons.ingredients[49] == Colors.yellow
        || buttons.ingredients[14] == Colors.yellow
        || buttons.ingredients[22] == Colors.yellow) && (buttons.filters[0] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black)) {
      count++;
    }

    if ((buttons.ingredients[50] == Colors.yellow
        || buttons.ingredients[51] == Colors.yellow
        || buttons.ingredients[52] == Colors.yellow
        || buttons.ingredients[33] == Colors.yellow
        || buttons.ingredients[32] == Colors.yellow
        || buttons.ingredients[29] == Colors.yellow) && (buttons.filters[0] != Colors.black && buttons.filters[1] != Colors.black && buttons.filters[2] != Colors.black)) {
      count++;
    }

    if ((buttons.ingredients[53] == Colors.yellow
        || buttons.ingredients[54] == Colors.yellow
        || buttons.ingredients[44] == Colors.yellow
        || buttons.ingredients[17] == Colors.yellow
        || buttons.ingredients[55] == Colors.yellow
        || buttons.ingredients[56] == Colors.yellow) && (buttons.filters[0] != Colors.black && buttons.filters[3] != Colors.black)) {
      count++;
    }

    if ((buttons.ingredients[57] == Colors.yellow
        || buttons.ingredients[15] == Colors.yellow
        || buttons.ingredients[5] == Colors.yellow
        || buttons.ingredients[54] == Colors.yellow) && (buttons.filters[0] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black)) {
      count++;
    }

    if ((buttons.ingredients[58] == Colors.yellow
        || buttons.ingredients[22] == Colors.yellow
        || buttons.ingredients[5] == Colors.yellow
        || buttons.ingredients[44] == Colors.yellow
        || buttons.ingredients[56] == Colors.yellow) && (buttons.filters[1] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black)) {
      count++;
    }

    // Add more conditions here...

    return count;
  }

  Container placeholder = Container(
    //put image widget here instead of container
    height: 130,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(
          10.0), //TODO: Fix border radius border between container/image and text should be 0
    ),
  );

  Widget buildImageContainer(String imagePath) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _buildFilterButtons(String label, int index) {
    return Padding(
      padding: EdgeInsets.only(right: 13),
      child: ElevatedButton(
        onPressed: () {
          final buttonsModel = context.read<ButtonsModel>();
          if (buttonsModel.filters[index] == Colors.white) {
            buttonsModel.updateFilters(index, Colors.black);
          } else {
            buttonsModel.updateFilters(index, Colors.white);
          }
          // Handle button press
        },
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: context
              .watch<ButtonsModel>()
              .filters[index],
          foregroundColor:
          context
              .watch<ButtonsModel>()
              .filters[index] == Colors.white
              ? Colors.black
              : Colors.white,
          // (^3)
          side: BorderSide(color: Colors.black, width: 1),
          // border color and width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // adjust as needed
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int recipeCount = countRecipes(context);
    List<Widget> recipeWidgets = [];
    // Get the Buttons instance
    final buttons = context.watch<ButtonsModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(height: 40),
                Row(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 25),
                      // To adjust "Select Ingredients" Header away from the left side)
                      child: Text(
                        'You can make $recipeCount recipe(s) with the\nwith the ingredient you selected',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ]),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // MainAxisAlignment.spaceBetween value means that the free space is evenly distributed between the children.
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      // To adjust "Select Ingredients" Header away from the left side)
                      child: Text(
                        'Ingredients\n(selected ingredients)',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      // To adjust "Select Ingredients" Header away from the left side)
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, AppRoutes.ingredientsPageScreen);
                        },
                        child: Text(
                          'edit',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // MainAxisAlignment.spaceBetween value means that the free space is evenly distributed between the children.
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      // To adjust "Select Ingredients Header away from the left edge)
                      child: Text(
                        "Filter",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 25,),
                      _buildFilterButtons('Breakfast', 0),
                      _buildFilterButtons('Lunch', 1),
                      _buildFilterButtons('Dinner', 2),
                      _buildFilterButtons('Desserts', 3),
                    ],
                  ),
                ),
                SizedBox(height: 45),
                if ((buttons.ingredients[1] == Colors.yellow
                    || buttons.ingredients[15] == Colors.yellow
                    || buttons.ingredients[16] == Colors.yellow
                    || buttons.ingredients[17] == Colors.yellow
                    || buttons.ingredients[13] == Colors.yellow
                    || buttons.ingredients[18] == Colors.yellow
                    || buttons.ingredients[12] == Colors.yellow
                    || buttons.ingredients[20] == Colors.yellow
                    || buttons.ingredients[21] == Colors.yellow)
                        && (buttons.filters[0] != Colors.black && buttons.filters[3] != Colors.black))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RecipeBlock(
                      child: buildImageContainer('images/Tinola.jpg'),
                      text: 'Tinola',
                      color: Colors.white,
                      onPress: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.setMyRecipe('Tinola');
                        Navigator.pushNamed(context, AppRoutes.tinola);
                      },
                    ),
                  ),

                if ((buttons.ingredients[0] == Colors.yellow
                    || buttons.ingredients[22] == Colors.yellow
                    || buttons.ingredients[23] == Colors.yellow
                    || buttons.ingredients[17] == Colors.yellow
                    || buttons.ingredients[24] == Colors.yellow
                    || buttons.ingredients[25] == Colors.yellow
                    || buttons.ingredients[26] == Colors.yellow
                    || buttons.ingredients[14] == Colors.yellow
                    || buttons.ingredients[15] == Colors.yellow)
                        && (buttons.filters[1] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RecipeBlock(
                      child: buildImageContainer('images/Tapsilog.jpg'),
                      text: 'Tapsilog',
                      color: Colors.white,
                      onPress: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.setMyRecipe('Tapsilog');
                        Navigator.pushNamed(context, AppRoutes.tapsilog);
                      },
                    ),
                  ),
                if ((buttons.ingredients[27] == Colors.yellow
                    || buttons.ingredients[28] == Colors.yellow
                    || buttons.ingredients[29] == Colors.yellow
                    || buttons.ingredients[22] == Colors.yellow
                    || buttons.ingredients[30] == Colors.yellow
                    || buttons.ingredients[31] == Colors.yellow
                    || buttons.ingredients[32] == Colors.yellow
                    || buttons.ingredients[33] == Colors.yellow
                    || buttons.ingredients[34] == Colors.yellow)
                        && (buttons.filters[1] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[0] != Colors.black))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RecipeBlock(
                      child: buildImageContainer('images/cassava_cake.jpg'),
                      text: 'Cassava Cake',
                      color: Colors.white,
                      onPress: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.setMyRecipe('Cassava Cake');
                        Navigator.pushNamed(context, AppRoutes.cassava_cake);
                      },
                    ),
                  ),
                if ((buttons.ingredients[2] == Colors.yellow
                    || buttons.ingredients[35] == Colors.yellow
                    || buttons.ingredients[4] == Colors.yellow
                    || buttons.ingredients[3] == Colors.yellow
                    || buttons.ingredients[12] == Colors.yellow
                    || buttons.ingredients[36] == Colors.yellow
                    || buttons.ingredients[13] == Colors.yellow
                    || buttons.ingredients[17] == Colors.yellow
                    || buttons.ingredients[33] == Colors.yellow
                    || buttons.ingredients[37] == Colors.yellow
                    || buttons.ingredients[38] == Colors.yellow
                    || buttons.ingredients[39] == Colors.yellow
                    || buttons.ingredients[14] == Colors.yellow
                    || buttons.ingredients[40] == Colors.yellow)
                        && (buttons.filters[0] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RecipeBlock(
                      child: buildImageContainer('images/menudo.jpg'),
                      text: 'Menudo',
                      color: Colors.white,
                      onPress: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.setMyRecipe('Menudo');
                        Navigator.pushNamed(context, AppRoutes.menudo);
                      },
                    ),
                  ),
                if ((buttons.ingredients[0] == Colors.yellow
                    || buttons.ingredients[41] == Colors.yellow
                    || buttons.ingredients[42] == Colors.yellow
                    || buttons.ingredients[43] == Colors.yellow
                    || buttons.ingredients[44] == Colors.yellow
                    || buttons.ingredients[45] == Colors.yellow
                    || buttons.ingredients[13] == Colors.yellow
                    || buttons.ingredients[12] == Colors.yellow) && (buttons.filters[0] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RecipeBlock(
                      child: buildImageContainer('images/bulalo.png'),
                      text: 'Bulalo',
                      color: Colors.white,
                      onPress: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.setMyRecipe('Bulalo');
                        Navigator.pushNamed(context, AppRoutes.bulalo);
                      },
                    ),
                  ),
                if ((buttons.ingredients[46] == Colors.yellow
                    || buttons.ingredients[47] == Colors.yellow
                    || buttons.ingredients[2] == Colors.yellow
                    || buttons.ingredients[13] == Colors.yellow
                    || buttons.ingredients[3] == Colors.yellow
                    || buttons.ingredients[47] == Colors.yellow
                    || buttons.ingredients[21] == Colors.yellow
                    || buttons.ingredients[48] == Colors.yellow
                    || buttons.ingredients[49] == Colors.yellow
                    || buttons.ingredients[14] == Colors.yellow
                    || buttons.ingredients[22] == Colors.yellow) && (buttons.filters[0] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RecipeBlock(
                      child: buildImageContainer('images/lumpiang_shanghai.jpg'),
                      text: 'Lumpiang Shanghai',
                      color: Colors.white,
                      onPress: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.setMyRecipe('Lumpiang Shanghai');
                        Navigator.pushNamed(context, AppRoutes.lumpiang_shanghai);
                      },
                    ),
                  ),
                if ((buttons.ingredients[50] == Colors.yellow
                       || buttons.ingredients[51] == Colors.yellow
                       || buttons.ingredients[52] == Colors.yellow
                       || buttons.ingredients[33] == Colors.yellow
                      || buttons.ingredients[32] == Colors.yellow
                      || buttons.ingredients[29] == Colors.yellow) && (buttons.filters[0] != Colors.black && buttons.filters[1] != Colors.black && buttons.filters[2] != Colors.black))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RecipeBlock(
                      child: buildImageContainer('images/champorado.png'),
                      text: 'Champorado',
                      color: Colors.white,
                      onPress: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.setMyRecipe('Champorado');
                        Navigator.pushNamed(context, AppRoutes.champorado);
                      },
                    ),
                  ),
                if ((buttons.ingredients[53] == Colors.yellow
                    || buttons.ingredients[54] == Colors.yellow
                    || buttons.ingredients[44] == Colors.yellow
                    || buttons.ingredients[17] == Colors.yellow
                    || buttons.ingredients[55] == Colors.yellow
                    || buttons.ingredients[56] == Colors.yellow) && (buttons.filters[0] != Colors.black && buttons.filters[3] != Colors.black))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RecipeBlock(
                      child: buildImageContainer('images/daing.jpg'),
                      text: 'Daing',
                      color: Colors.white,
                      onPress: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.setMyRecipe('Daing');
                        Navigator.pushNamed(context, AppRoutes.daing);
                      },
                    ),
                  ),
                if ((buttons.ingredients[57] == Colors.yellow
                       || buttons.ingredients[15] == Colors.yellow
                        || buttons.ingredients[5] == Colors.yellow
                        || buttons.ingredients[54] == Colors.yellow) && (buttons.filters[0] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RecipeBlock(
                      child: buildImageContainer('images/tuyo.jpg'),
                      text: 'Tuyo',
                      color: Colors.white,
                      onPress: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.setMyRecipe('Tuyo');
                        Navigator.pushNamed(context, AppRoutes.tuyo);
                      },
                    ),
                  ),
                if ((buttons.ingredients[58] == Colors.yellow
                    || buttons.ingredients[22] == Colors.yellow
                    || buttons.ingredients[5] == Colors.yellow
                    || buttons.ingredients[44] == Colors.yellow
                    || buttons.ingredients[56] == Colors.yellow) && (buttons.filters[1] != Colors.black && buttons.filters[2] != Colors.black && buttons.filters[3] != Colors.black))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RecipeBlock(
                      child: buildImageContainer('images/omelet.jpg'),
                      text: 'Omelet',
                      color: Colors.white,
                      onPress: () {
                        final buttons = context.read<ButtonsModel>();
                        buttons.setMyRecipe('Omelet');
                        Navigator.pushNamed(context, AppRoutes.omelet);
                      },
                    ),
                  ),
              ]
              ))),
      bottomNavigationBar: NavBar(
        selectedIndex: 1,
      ),
    );
  }
}