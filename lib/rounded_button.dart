import 'package:flutter/material.dart';
import 'package:kusina_app_v3/styles.dart';
/*
const kButtonTextStyle = TextStyle(
  fontSize: 16.99,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);
*/
class RoundedButton extends StatelessWidget {
  RoundedButton({ required this.text, this.icon, this.onPress, this.color});

  final String? text;
  final IconData? icon;
  final Function()? onPress;
  final Color? color; //button color

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
            SizedBox(
              width: 12,
            ),
            Icon(
              icon, //button icon at the right
              color: kTextColor,
            ),
          ],
        ),
      ),
    );
  }
}


