import 'package:flutter/material.dart';
import 'package:kusina_app_v3/styles.dart';


class RoundedButton extends StatelessWidget {
  RoundedButton({ required this.text, this.onPress, this.color});

  final String? text;
  final Function()? onPress;
  final Color? color; //button color

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          //button color
          backgroundColor: color, //button color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text!, //button text
              style: kBottomButtonText, //text style
            ),
          ],
        ),
      ),
    );
  }
}

class MiddleButton extends RoundedButton {
  Widget? _gapBetweenTextAndIcon;
  Widget? _iconWidget;

  MiddleButton({required this.text, this.icon, this.onPress, this.color}) : super(text: 'MIDDLE BUTTON');

  final String? text;
  final IconData? icon;
  final Function()? onPress;
  final Color? color;

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

  //same with rounded button but with added gap and icon in Row
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          //button color
          backgroundColor: color, //button color
        ),
        child: Row(
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
    );
  }
}
