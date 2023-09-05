import 'package:comic_clock/Screens/cartoon/WishlistPage.dart';
import 'package:flutter/material.dart';

import '../../Widgets/CustomBottomNavigationBar.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';

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






