import 'package:flutter/material.dart';

import '../Utils/GradientIcons.dart';
import '../Utils/constants.dart';
import 'CustomShape.dart';

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
    double h=150;
    return Container(
      height: h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: Customshape(),
              child: Container(
                height: h,
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
                    padding: EdgeInsets.only(bottom: h/5.5),
                    child:
                    GradientIcon(
                      Icons.home,
                      45,
                      kAccentGradient,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () => _handleTabSelected(1),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: h/3),
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
                      padding: EdgeInsets.only(bottom: h/5.5),
                      child: GradientIcon(
                        Icons.person,
                        45,
                        kAccentGradient,
                      )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}