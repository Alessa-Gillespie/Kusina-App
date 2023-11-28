import 'package:flutter/material.dart';
import 'package:kusina_app_v3/recipe_block.dart';
import 'package:kusina_app_v3/rounded_button.dart';

import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

class ResultsPageScreen extends StatefulWidget {
  @override
  resultsPageScreenState createState() => resultsPageScreenState();
}

class resultsPageScreenState extends State<ResultsPageScreen> {
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

  @override
  Widget build(BuildContext context) {
    // Get the Buttons instance
    final buttons = context.watch<ButtonsModel>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Results'),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          SizedBox(height: 50),
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 20),
                // To adjust "Select Ingredients" Header away from the left side)
                child: Text(
                  'You can make 1 ingredient with the\nwith the ingredient you selected',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
          ]),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // MainAxisAlignment.spaceBetween value means that the free space is evenly distributed between the children.
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15),
                // To adjust "Select Ingredients" Header away from the left side)
                child: Text(
                  'Ingredients\n(selected ingredients)',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0),
                // To adjust "Select Ingredients" Header away from the left side)
                child: Text(
                  'edit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // MainAxisAlignment.spaceBetween value means that the free space is evenly distributed between the children.
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        // To adjust "Select Ingredients Header away from the left edge)
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
                  ),
        ]))));
  }
}
