import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:kusina_app_v3/routes/app_routes.dart';

enum Button {
  home,
  recipes,
  shopping_cart,
  favorites,
}

class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kNavBarColor,
      height: 68,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical:0),
        child: Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconGroup(
                  icon: Icons.home_rounded,
                  text: 'Home',
                  onPress: () {

                    Navigator.pushNamed(context, AppRoutes.homePage);
                  }
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: IconGroup(
                    icon: Icons.home_rounded,
                    text: 'Recipes',
                    onPress: () {
                      Navigator.pushNamed(context, AppRoutes.resultsPageScreen); //if no selected ingredients,
                                                                                 // it should be recipes page instead
                    }
                ),
              ),
              IconGroup(
                  icon: Icons.shopping_cart_rounded,
                  text: 'Shopping List',
                  onPress: () {
                    Navigator.pushNamed(context, AppRoutes.shoppingListScreen);
                  }
              ),
              IconGroup(
                  icon: Icons.home_rounded,
                  text: 'Favorites',
                  onPress: () {
                    Navigator.pushNamed(context, AppRoutes.favoritesPageScreen);
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class IconGroup extends StatelessWidget{
  IconGroup({ required this.text, required this.icon, required this.onPress,});

  //named parameters
  final String? text;
  final Function()? onPress;
  final IconData? icon;
  final Color? iconColor = kNavBarTextColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //IconButton(
            //   icon: new Image.asset("images/IG.png"),
            //   scale: 0.5,
            // ),
            Icon(
                icon,
                color: iconColor,
                size: 35
            ),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: kNavBarTextTextStyle,
            )
          ],
        ),
      ),
    );
  }
}