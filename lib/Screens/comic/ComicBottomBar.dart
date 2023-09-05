import 'package:comic_clock/Screens/comic/ComicHomePage.dart';
import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/material.dart';

import 'ComicProfilePage.dart';
import 'ComicWishlistPage.dart';

class ComicBottomBar extends StatefulWidget {
  const ComicBottomBar({Key? key}) : super(key: key);

  @override
  State<ComicBottomBar> createState() => _ComicBottomBarState();
}

class _ComicBottomBarState extends State<ComicBottomBar> {
  @override
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ComicHomePage(),
    ComicWishlistPage(),
    ComicProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: cPrimaryColor,
          elevation: 0,
          backgroundColor: cSecondaryColor,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: AppIcons.cHome,
              label: '',
            ),

            BottomNavigationBarItem(
              icon: AppIcons.bomb,
              label: '',
            ),
            BottomNavigationBarItem(
              icon: AppIcons.cProfile,
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
