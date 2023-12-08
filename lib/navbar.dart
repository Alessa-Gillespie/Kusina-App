import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:kusina_app_v3/routes/app_routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Button {
  home,
  recipes,
  shopping_cart,
  favorites,
}

class NavBar extends StatelessWidget {
  NavBar({this.onPress, required this.selectedIndex});
  final onPress;
  final selectedIndex;

  final Color _InactiveNavColor = kNavBarTextColor,
      _ActiveNavColor = kMainColor;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: kNavBarColor,
      height: height/10.5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04, vertical:0),
        child: Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: IconGroup(
                    icon: FontAwesomeIcons.house,
                    text: 'Home',
                    color: selectedIndex == 0
                        ? _ActiveNavColor
                        : _InactiveNavColor,
                    onPress: () {
                      Navigator.pushNamed(context, AppRoutes.homePage);
                    }
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconGroup(
                      icon: FontAwesomeIcons.bookOpen,
                      text: 'Recipes',
                      color: selectedIndex == 1
                          ? _ActiveNavColor
                          : _InactiveNavColor,
                      onPress: () {
                        Navigator.pushNamed(context, AppRoutes.resultsPageScreen); //if no selected ingredients,
                                                                                   // it should be recipes page instead
                      }
                  ),
                ),
              ),
              Expanded(
                child: IconGroup(
                    icon: FontAwesomeIcons.cartShopping,
                    text: 'Shopping List',
                    color: selectedIndex == 2
                        ? _ActiveNavColor
                        : _InactiveNavColor,
                    onPress: () {
                      Navigator.pushNamed(context, AppRoutes.shoppingListScreen);
                    }
                ),
              ),
              Expanded(
                child: IconGroup(
                    icon: FontAwesomeIcons.solidHeart,
                    text: 'Favorites',
                    color: selectedIndex == 3
                        ? _ActiveNavColor
                        : _InactiveNavColor,
                    onPress: () {
                      Navigator.pushNamed(context, AppRoutes.favoritesPageScreen);
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconGroup extends StatelessWidget{
  IconGroup({ required this.text, required this.icon, required this.onPress,this.color});

  //named parameters
  final String? text;
  final Function()? onPress;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
                icon,
                color: color,
                size: 19
            ),
            SizedBox(height: 3),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: kNavBarTextTextStyle.copyWith(color: color),
            )
          ],
        ),
      ),
    );
  }
}