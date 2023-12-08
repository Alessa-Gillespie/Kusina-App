/*

//TODO: import Roboto font family

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


import 'package:provider/provider.dart';
import 'package:kusina_app_v3/stateManagement/buttons.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // (^0)
import 'package:kusina_app_v3/routes//app_routes.dart';

import 'package:kusina_app_v3/styles.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Binding Dart Layer & Flutter Engine.
  SystemChrome.setPreferredOrientations([ // Keep it vertival.
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ButtonsModel(), // Making it accesible.
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // theme: theme,
      title: 'kusina_v3', // Title
      debugShowCheckedModeBanner: false, // (^3)
      initialRoute: AppRoutes.homePage, // Initial route.
      routes: AppRoutes.routes,
      theme: ThemeData( // (^4)
       // primarySwatch: Colors.blue, (Ignore For Now)
        textTheme: GoogleFonts.robotoTextTheme(), //default font family
        appBarTheme: AppBarTheme( // (^5))
          backgroundColor: kAppBarBackgroundColor, // (^6)
          elevation: 0, // (^7)
          iconTheme: IconThemeData(color: Colors.black), // (^7)
          foregroundColor: Colors.black, // (^8)
        ),
        scaffoldBackgroundColor: kBackgroundColor,
      ),
    );
  }
}