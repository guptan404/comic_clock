import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../Widgets/AppBar.dart';

class ComicProfilePage extends StatefulWidget {
  const ComicProfilePage({Key? key}) : super(key: key);

  @override
  State<ComicProfilePage> createState() => _ComicProfilePageState();
}

class _ComicProfilePageState extends State<ComicProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: cSecondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(height: 55,),
          CustomAppBar(context, false, false),
          SizedBox(height: 55,),
            _thoughtBubble("Giggle Streak", "1000+"),
          ]
        ),
      ),
    );
  }
  Widget _speechBubble(String title, String content) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white, // Speech bubble background color
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black, // Text color
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(
              color: Colors.black, // Text color
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
  Widget _thoughtBubble(String title, String content) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white, // Speech bubble background color
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: Offset(2, 2),
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 0,
                height: 0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 10,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                transform: Matrix4.rotationY(math.pi),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                content,
                style: TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }

}
