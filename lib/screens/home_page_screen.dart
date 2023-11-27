
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
          backgroundColor: Colors.white,
      ),
      body: Align(
        alignment: Alignment.center, // Change this to move the text
        child: Text(
          'Hello Home',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
