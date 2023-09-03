import 'package:comic_clock/Screens/HomePage.dart';
import 'package:comic_clock/Screens/WishlistPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/ProfilePage.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  final args=routeSettings.arguments;
  switch (routeSettings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage(),
      );

    case ProfilePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProfilePage(),
      );

    case WishlistPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WishlistPage(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>
        const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}