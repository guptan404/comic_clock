import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';

Widget EmojiContainer (BuildContext context,String type,String emoji) {

  return Container(
     color: Colors.transparent,
    height: double.infinity,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            //SizedBox(width: 5),
            Opacity(
              opacity: 0.3,
              child: type=='random'?
              Image.asset(
                cowboyEmojiImg,
                width: 180,
                height: 180,
              )
            :Text(emoji,style: TextStyle(fontSize: 180),)
            ),
            SizedBox(height: 10), // Add SizedBox for vertical spacing
          ],
        ),
        // Add SizedBox for horizontal spacing
        Row(
          children: [
           SizedBox(width: 500,),
            Opacity(
              opacity: 0.7,
              child: Image.asset(
                sunglassEmoImg,
                width: 120,
                height: 120,
              ),
            ),
            SizedBox(height: 10), // Add SizedBox for vertical spacing
          ],
        ),
        SizedBox(width: 40), // Add SizedBox for horizontal spacing
        Row(
          children: [
            SizedBox(width: 40),
            Opacity(
              opacity: 0.8,
              child: Image.asset(
                winkEmojiImg,
                width: 70,
                height: 70,
              ),
            ),
            // Add SizedBox for vertical spacing
          ],
        ),
        SizedBox(width: 10), // Add SizedBox for horizontal spacing
        Row(
          children: [
            Opacity(
              opacity: 0.8,
              child: Image.asset(
                fireEmoImg,
                width: 60,
                height: 60,
              ),
            ),
            SizedBox(height: 80), // Add SizedBox for vertical spacing
          ],
        ),
        SizedBox(width: 10), // Add SizedBox for horizontal spacing
        // Add more columns and SizedBox widgets as needed
      ],
    ),
  );
}