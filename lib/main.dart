/*

Code Notes:

(^0)
In order to implement 'SystemChrome' & 'DeviceOrientation'

(^1)
initialize the binding between the Flutter
framework and the host
platform (e.g. Android or iOS)

(^2)
This line sets the preferred orientation
of the device. In this case, in portrait mode
with the home button at the bottom.

(^3)
Turns off the“DEBUG” banner in debug mode.

(^4)
theme property specifies the default visual properties,
like colors and text styles, for the app’s widgets.

(^5)
Covers all AppBars

(^6)
Sets the background color to white

(^7)
Removes the border below the AppBar

(^8)
Sets text to black color

 */


import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // (^0)
import 'package:kusina_app_v3/routes//app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // (^1)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // (^2)
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // theme: theme,
      title: 'kusina_v3',
      debugShowCheckedModeBanner: false, // (^3)
      initialRoute: AppRoutes.ingredientsPageScreen,
      routes: AppRoutes.routes,
      theme: ThemeData( // (^4)
       // primarySwatch: Colors.blue, (Ignore For Now)
        appBarTheme: AppBarTheme( // (^5))
          backgroundColor: Colors.white, // (^6)
          elevation: 0, // (^7)
          iconTheme: IconThemeData(color: Colors.black), // (^7)
          foregroundColor: Colors.black, // (^8)
        ),
      ),
    );
  }
}