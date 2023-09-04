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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Opacity(
                opacity: 0.3,
                child: type=='random'?
                Image.asset(
                  winkEmojiImg,
                  width: 100,
                  height: 100,
                )
                    :Text(emoji,style: TextStyle(fontSize: 50),)
            ),
          ],
        ),
        Stack(

          children: [
            //SizedBox(width: 5),
            Positioned(
              top: 150,
              left: 20,
              child: Opacity(
                  opacity: 0.3,
                  child: type=='random'?
                  Image.asset(
                    cowboyEmojiImg,
                    width: 170,
                    height: 170,
                  )
                      :Text(emoji,style: TextStyle(fontSize: 180),)
              ),
            ),
            Positioned(
              top: 100,
              left: 50,
              child: Opacity(
                opacity: 0.3,
                child: type=='random'?
                Image.asset(
                  thinkEmoImg,
                  width: 250,
                  height: 250,
                )
              :Text(emoji,style: TextStyle(fontSize: 180),)
              ),
            ),
            SizedBox(height: 10), // Add SizedBox for vertical spacing
          ],
        ),
        // Add SizedBox for horizontal spacing
        Row(
          children: [
           SizedBox(width: 250,),
            Opacity(
              opacity: 0.3,
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

            Opacity(
              opacity: 0.3,
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
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Spacer(),
              Opacity(
                opacity: 0.2,
                child: Image.asset(
                  heartEyeEmoImg,
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(height: 80), // Add SizedBox for vertical spacing
            ],
          ),
        ),
        SizedBox(height: 50),
        Row(
          children: [
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                smileEmoImg,
                width: 60,
                height: 60,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Spacer(),
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                cowboyEmojiImg,
                width: 70,
                height: 70,
              ),
            ),
          ],
        ),// Add SizedBox for horizontal spacing
        // Add more columns and SizedBox widgets as needed
      ],
    ),
  );
}