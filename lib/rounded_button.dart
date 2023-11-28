import 'package:flutter/material.dart';

const kButtonTextStyle = TextStyle(
  fontSize: 16.99,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);

class RoundedButton extends StatelessWidget {
  RoundedButton({ required this.text, this.icon, this.onPress, this.color});

  final String? text;
  final IconData? icon;
  final Function()? onPress;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          //button color
          backgroundColor: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                text!, //button text
                style: kButtonTextStyle
            ),
            SizedBox(
              width: 12,
            ),
            Icon(
              icon, //button icon at the right
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}


