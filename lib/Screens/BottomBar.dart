import 'dart:math';

import 'package:comic_clock/Screens/HomePage.dart';
import 'package:comic_clock/Screens/ProfilePage.dart';
import 'package:comic_clock/Screens/WishlistPage.dart';
import 'package:comic_clock/Utils/constants.dart';
import 'package:comic_clock/Widgets/AppBar.dart';
import 'package:comic_clock/Widgets/ElevatedIcon.dart';
import 'package:flutter/material.dart';

import '../Utils/GradientIcons.dart';
import '../Widgets/CustomBottomNavigationBar.dart';
import '../Utils/CustomShape.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [

    const HomePage(),
    const WishlistPage(),
    const ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar:CustomBottomNavigationBar(onTabSelected: (index ) {
      setState(() {
              _currentIndex = index;
        });
      },),
    );
  }



}






