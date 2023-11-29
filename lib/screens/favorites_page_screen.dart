import 'package:flutter/material.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/button_components.dart';
import 'package:kusina_app_v3/routes//app_routes.dart';
import 'package:kusina_app_v3/styles.dart';
import 'package:kusina_app_v3/navbar.dart';

const spaceBetweenTextAndBlock = 17;
const spaceBetweenRecipeBlocks = 18;

/*
const kInactiveButtonColor = Colors.yellow;
const kActiveButtonColor = Colors.black;
*/
class FavoritesPageScreen extends StatefulWidget {
  @override
  _FavoritesPageScreenState createState() => _FavoritesPageScreenState();
}

class _FavoritesPageScreenState extends State<FavoritesPageScreen> {
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

  Widget _buildFilterSection(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Filter',
              style: kBodyBoldTextStyle,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 34,
            child: Flexible(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 25),
                  FilterButton(
                    text: 'Breakfast',
                    onPress: () {
                    //change button color
                    setState((){
                       FilterButton.changeButtonColor();
                    });
                    //add to some list for processing for result?
                    },
                  ),
                  FilterButton(
                    text: 'Breakfast',
                    onPress: () {
                      //change button color
                      setState((){
                        FilterButton.changeButtonColor();
                      });
                      //add to some list for processing for result?
                    },
                  ),
                  FilterButton(
                    text: 'Breakfast',
                    onPress: () {
                      //change button color
                      setState((){
                        FilterButton.changeButtonColor();
                      });
                      //add to some list for processing for result?
                    },
                  ),
                  FilterButton(
                    text: 'Breakfast',
                    onPress: () {
                      //change button color
                      setState((){
                        FilterButton.changeButtonColor();
                      });
                      //add to some list for processing for result?
                    },
                  ),
                  FilterButton(
                    text: 'Breakfast',
                    onPress: () {
                      //change button color
                      setState((){
                        FilterButton.changeButtonColor();
                      });
                      //add to some list for processing for result?
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeBlocks(){
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: <RecipeBlock>[
          RecipeBlock(
            child: placeholder, //child height should be 170
            //recipe's image
            text: 'Recipe Name', //recipe's name
            color: kBlockColor,
            onPress: () {
              //TODO: direct to recipe instruction page
            },
          ),
          RecipeBlock(
            child: placeholder, //child height should be 170
            //recipe's image
            text: 'Recipe Name', //recipe's name
            color: kBlockColor,
            onPress: () {
              //TODO: direct to recipe instruction page
            },
          ),
          RecipeBlock(
            child: placeholder, //child height should be 170
            //recipe's image
            text: 'Recipe Name', //recipe's name
            color: kBlockColor,
            onPress: () {
              //TODO: direct to recipe instruction page
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
          //TODO: edit the header (add color, change font style)
          title: Text('Kusina'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 22),
          Expanded(
            child: Column(//recipe blocks
              children: <Widget>[
                _buildFilterSection(),//filter
                _buildRecipeBlocks(),//recipe blocks
              ],
          ),
        ),
       ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }

}