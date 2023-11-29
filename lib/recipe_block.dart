//template for creating a recipe block (or tile)
import 'package:flutter/material.dart';
import 'package:kusina_app_v3/styles.dart';

class RecipeBlock extends StatelessWidget {
  RecipeBlock({required this.child, required this.text, this.onPress, this.color});

  final String? text; //recipe name text
  final Color? color; //block color
  final Widget child; //image
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPress,
      child: Expanded(
        child: Container(
            margin: EdgeInsets.only(bottom: 22),
            decoration: BoxDecoration(
                color: color, //block color
                borderRadius: BorderRadius.circular(10.0),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 9,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                child, //image (height should be 170)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16,9,16,9),
                  child: Text(
                    text!, //recipe name text
                    style: kRecipeBlockTextTextStyle,
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}