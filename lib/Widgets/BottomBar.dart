import 'dart:math';

import 'package:comic_clock/Screens/HomePage.dart';
import 'package:comic_clock/Screens/ProfilePage.dart';
import 'package:comic_clock/Screens/WishlistPage.dart';
import 'package:comic_clock/Utils/constants.dart';
import 'package:comic_clock/Widgets/AppBar.dart';
import 'package:comic_clock/Widgets/ElevatedIcon.dart';
import 'package:flutter/material.dart';

import 'CustomShape.dart';

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
      // BottomNavigationBar(
      //     elevation: 0,
      //   //landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      //   type: BottomNavigationBarType.shifting,
      //   backgroundColor: Colors.transparent,
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //      icon:ShaderMask(
      //       shaderCallback: (Rect bounds) {
      //         return kAccentGradient.createShader(bounds);
      //       },
      //       child:AppIcons.home,
      //     ),
      //      tooltip: "Home",
      //       label: "",
      //       activeIcon: ShaderMask(
      //         shaderCallback: (Rect bounds) {
      //           return kAccentGradient.createShader(bounds);
      //         },
      //         child:ElevatedIcon(context, AppIcons.home, 15)
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         winkEmojiImg, // Replace with your image asset
      //         width: 66,
      //         height: 66,
      //       ),
      //      label: "",
      //       //activeIcon: ElevatedIcon(context, AppIcons.home, 5)
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ShaderMask(
      //         shaderCallback: (Rect bounds) {
      //           return kAccentGradient.createShader(bounds);
      //         },
      //         child:AppIcons.profile,
      //       ),
      //      tooltip: "Profile",
      //         label: "",
      //       activeIcon: ElevatedIcon(context, AppIcons.profile, 5)
      //     ),
      //   ],
      //
      // ),
    );
  }



}


class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onTabSelected;

  CustomBottomNavigationBar({required this.onTabSelected});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _handleTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });

    // Notify the parent widget about the selected tab.
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: Customshape(),
            child: Container(
              height: 150,
              color: Color.fromRGBO(77, 218, 249, 0.42),
              width: MediaQuery.of(context).size.width,
              // decoration: const BoxDecoration(
              //     borderRadius: BorderRadius.vertical(
              //       top: Radius.circular(360),
              //     ),
              //     color: Colors.orange),

            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _handleTabSelected(0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 150/5.3),
                  child:ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return kAccentGradient.createShader(bounds);
                    },
                    child:AppIcons.home,
                  ),
                ),
              ),

              GestureDetector(
                onTap: () => _handleTabSelected(1),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 150/3),
                  child: Image.asset(
                    winkEmojiImg, // Replace with your image asset
                    width: 66,
                    height: 66,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _handleTabSelected(2),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 150/5.3),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return kAccentGradient.createShader(bounds);
                    },
                    child:AppIcons.profile,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    //   Container(
    //   color: Colors.blue, // Background color of your navigation bar
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       IconButton(
    //         icon: Icon(Icons.home),
    //         color: _selectedIndex == 0 ? Colors.white : Colors.grey,
    //         onPressed: () => _handleTabSelected(0),
    //       ),
    //       IconButton(
    //         icon: Icon(Icons.search),
    //         color: _selectedIndex == 1 ? Colors.white : Colors.grey,
    //         onPressed: () => _handleTabSelected(1),
    //       ),
    //       IconButton(
    //         icon: Icon(Icons.person),
    //         color: _selectedIndex == 2 ? Colors.white : Colors.grey,
    //         onPressed: () => _handleTabSelected(2),
    //       ),
    //     ],
    //   ),
    // );
  }
}




