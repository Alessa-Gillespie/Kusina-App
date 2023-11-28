//TODO: make recipe block responsive to text length (text height changes but image height stays the same)
import 'package:flutter/material.dart';
import 'package:kusina_app_v3/styles.dart';

//style from home page screen
/*
const kNormalBoldTextStyle = TextStyle(
  fontSize: 16.99,
  color: Colors.black,
  fontWeight: FontWeight.w800,
);
*/
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
      child: Container(
          height: 170,
          margin: EdgeInsets.only(bottom: 18),
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
              child, //image
              Padding(
                padding: const EdgeInsets.fromLTRB(15,6,15,6),
                child: Text(
                  text!, //recipe name text
                  style: kRecipeBlockTextTextStyle,
                ),
              ),
            ],
          )
      ),
    );
  }
}