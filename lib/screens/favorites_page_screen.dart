//commented out Recipe Block (properties are changed. go to recipe_block.dart to see)
import 'package:flutter/material.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/button_components.dart';
import 'package:kusina_app_v3/styles.dart';
import 'package:kusina_app_v3/navbar.dart';
import 'package:kusina_app_v3/recipe.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';

// Import the provider packages
import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

const spaceBetweenTextAndBlock = 17;
const spaceBetweenRecipeBlocks = 18;

//TEMPORARY
Recipe lugawRecipeObject = Recipe(
  name: 'Lugaw (from favorites page)',
  imagePath: 'images/Tinola.jpg',
  ingredientsList: [
    '1 cup long grain white rice',
    '4 to 5 cups water',
    '2 teaspoons salt',
    '1/4 cup rousong pork floss',
  ],
  instructionsList: [
    '1. Pour water in a cooking pot. Bring to a boil.',
    '2. Put-in the rice. Continue cooking for 30 minutes or until the texture becomes thick, while stirring once in awhile.',
    '3. Add the salt, stir and then cook for 2 minutes more.',
    '4. Transfer to a serving bowl. Top with a tablespoon of rousing.',
    '5. Serve hot. Share and enjoy!',
  ],
  //video:
  sourceLink: 'https://panlasangpinoy.com/lugaw-recipe/', //source
);

class FavoritesPageScreen extends StatefulWidget {
  @override
  _FavoritesPageScreenState createState() => _FavoritesPageScreenState();
}

class _FavoritesPageScreenState extends State<FavoritesPageScreen> {
  bool _favoritesListIsEmpty =
      true; //depends sa "database" ng favorites and controls the display of _buildEmptySection()
  //NOTE: this bool is just a placeholder variable to control the display

  //TEMPORARY CONTAINER PLACEHOLDER FOR IMAGE
  Container placeholder = Container(
    //put image widget here instead of container
    height: 170, //this should be the image height
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(
          10.0), //TODO: Fix border radius border between container/image and text should be 0
    ),
  );

  Widget _buildFilterButtons(String label, int index) {
    return Padding(
      padding: EdgeInsets.all(7),
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
          backgroundColor: context.watch<ButtonsModel>().filters[index],
          foregroundColor:
              context.watch<ButtonsModel>().filters[index] == Colors.white
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

  Widget _buildEmptySection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttons = context.watch<ButtonsModel>();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('Favorites'),
      ),

      // context.read<ButtonsModel>().isAnyHeartIconPressed()
      //                 ? _buildEmptySection()//empty display
      //                 :

      body: SafeArea(
        child: !context.read<ButtonsModel>().isAnyHeartIconPressed()
            ? _buildEmptySection() //empty display
            : SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 22),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Filter",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _buildFilterButtons('Breakfast', 0),
                    _buildFilterButtons('Lunch', 1),
                    _buildFilterButtons('Dinner', 2),
                    _buildFilterButtons('Desserts', 3),
                  ],
                ),
              ), //filter
              SizedBox(height: 30),
              if ((buttons.filters[0] != Colors.black &&
                  buttons.filters[3] != Colors.black) && (buttons.isHeartIconPressed('tinola')))
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
              if ((buttons.isHeartIconPressed('tapsilog')) &&
                  (buttons.filters[1] != Colors.black &&
                      buttons.filters[2] != Colors.black &&
                      buttons.filters[3] != Colors.black))
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
              if ((buttons.isHeartIconPressed('cassava_cake')) &&
                  (buttons.filters[1] != Colors.black &&
                      buttons.filters[2] != Colors.black &&
                      buttons.filters[0] != Colors.black))
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
              if ((buttons.isHeartIconPressed('menudo')) &&
                  (buttons.filters[0] != Colors.black &&
                      buttons.filters[2] != Colors.black &&
                      buttons.filters[3] != Colors.black))
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
              if ((buttons.isHeartIconPressed('bulalo')) &&
                  (buttons.filters[0] != Colors.black &&
                      buttons.filters[2] != Colors.black &&
                      buttons.filters[3] != Colors.black))
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
              if ((buttons.isHeartIconPressed('lumpiang_shanghai')) &&
                  (buttons.filters[0] != Colors.black &&
                      buttons.filters[2] != Colors.black &&
                      buttons.filters[3] != Colors.black))
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
              if ((buttons.isHeartIconPressed('champorado')) &&
                  (buttons.filters[0] != Colors.black &&
                      buttons.filters[1] != Colors.black &&
                      buttons.filters[2] != Colors.black))
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
              if ((buttons.isHeartIconPressed('daing')) &&
                  (buttons.filters[0] != Colors.black &&
                      buttons.filters[3] != Colors.black))
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
              if ((buttons.isHeartIconPressed('tuyo')) &&
                  (buttons.filters[0] != Colors.black &&
                      buttons.filters[2] != Colors.black &&
                      buttons.filters[3] != Colors.black))
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
              if ((buttons.isHeartIconPressed('omelet')) &&
                  (buttons.filters[1] != Colors.black &&
                      buttons.filters[2] != Colors.black &&
                      buttons.filters[3] != Colors.black))
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
              // display favorite recipes
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 3,
      ),
    );
  }
}
