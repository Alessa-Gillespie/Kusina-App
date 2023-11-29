/*
Contains classes:
BottomButton - wide bottom button with no icon (should be fixed at the bottom
               above nav bar if applicable)
MiddleButton - button in home page with icon
IngredientButton - outlined button and changes into yellow when pressed
FilterButton - smaller version of Ingredient Button, but turns black
               when pressed

they all have VERY SIMILAR STRUCTURE, but yun nga lang di ko maapply inheritance dito
 */
import 'package:flutter/material.dart';
import 'package:kusina_app_v3/styles.dart';

class BottomButton extends StatelessWidget {
  BottomButton({ required this.text, required this.onPress});

  //named parameters
  final String? text;
  final Function()? onPress;

  //ingredient button styles
  final EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 20, vertical: 8);
  final Color _inactiveButtonColor = kInactiveFilledButtonColor,
      _activeButtonColor = kActiveFilledButtonColor;
  final TextStyle _textStyle = kBottomButtonText;

  //button is pressed
  static bool _isPressed = false;
  static void changeButtonColor() { //accessible by other classes to use in setState()
    _isPressed = _isPressed == false
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _isPressed == false //button color
              ? _inactiveButtonColor
              : _activeButtonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: _padding,
          child: Text(
            text!, //button text
            style: _textStyle,
          ),
        ),
      ),
    );
  }
}

class MiddleButton extends StatelessWidget {
  MiddleButton({ required this.text, required this.icon, required this.onPress,});

  //named parameters
  final String? text;
  final Function()? onPress;
  final IconData? icon;

  //local variables
  Widget? _gapBetweenTextAndIcon;
  Widget? _iconWidget;

  //ingredient button styles
  final EdgeInsets _padding = EdgeInsets.symmetric(vertical: 8);
  final Color _inactiveButtonColor = kInactiveFilledButtonColor,
      _activeButtonColor = kActiveFilledButtonColor;
  final TextStyle _textStyle = kMiddleButtonText;

  //button is pressed
  static bool _isPressed = false;
  static void changeButtonColor() { //accessible by other classes to use in setState()
    _isPressed = _isPressed == false
        ? true
        : false;
  }

  SizedBox _buildGap() {
    return SizedBox(
      width: 12,//gap between text and icon
    );
  }

  Icon _buildIcon() {
    return Icon(
      icon,
      color: kTextColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _isPressed == false //button color
              ? _inactiveButtonColor
              : _activeButtonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: _padding,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!, //button text
                style: kMiddleButtonText,
              ),
              _gapBetweenTextAndIcon = _buildGap(),
              _iconWidget = _buildIcon(),
            ],
          ),
        ),
      ),
    );
  }
}

class IngredientButton extends StatelessWidget {
  IngredientButton({ required this.text, required this.onPress});

  //named parameters
  final String? text;
  final Function()? onPress;

  //ingredient button styles
  final EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 20, vertical: 8);
  final Color _inactiveButtonColor = Colors.transparent,
      _activeButtonColor = kActiveIngredientButtonColor;
  final Color _inactiveBorderColor = kTextColor,
      _activeBorderColor = kActiveIngredientButtonColor;
  final TextStyle _inactiveTextStyle = kIngredientButtonText,
      _activeTextStyle = kIngredientButtonText;

  //button is pressed
  static bool _isPressed = false;
  static void changeButtonColor() { //accessible by other classes
    _isPressed = _isPressed == false
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: _isPressed == false //button color
              ? _inactiveButtonColor
              : _activeButtonColor,
          border: Border. all(
              width: 2.5,
              color: _isPressed == false //border color
                  ? _inactiveBorderColor
                  : _activeBorderColor
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: _padding,
          child: Text(
            text!, //button text
            style: _isPressed == false //text style and color
                ? _inactiveTextStyle
                : _activeTextStyle,
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {

  //inherit super constructor
  FilterButton({ required this.text, required this.onPress});

  //named parameters
  final String? text;
  final Function()? onPress;

  //filter button styles
  final EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
  final Color _inactiveButtonColor = Colors.transparent,
      _activeButtonColor = kActiveFilterButtonColor;
  final Color _inactiveBorderColor = kTextColor,
      _activeBorderColor = kActiveFilterButtonColor;
  final TextStyle _inactiveTextStyle = kFilterButtonText.copyWith(fontWeight: FontWeight.w600),
      _activeTextStyle = kFilterButtonText.copyWith(color: Colors.white);

  //inherit changeColor() and build() of Parent Class

 //button is pressed
  static bool _isPressed = false;
  static void changeButtonColor() { //accessible by other classes
    _isPressed = _isPressed == false
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 20,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 11),
        decoration: BoxDecoration(
          color: _isPressed == false //button color
              ? _inactiveButtonColor
              : _activeButtonColor,
          border: Border.all(
              width: 1.5,
              color: _isPressed == false //border color
                  ? _inactiveBorderColor
                  : _activeBorderColor
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Flexible(
          child: Padding(
            padding: _padding,
            child: Text(
              text!, //button text
              style: _isPressed == false //text style and color
                  ? _inactiveTextStyle
                  : _activeTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
