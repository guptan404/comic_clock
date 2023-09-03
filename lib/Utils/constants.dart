import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';


//<-----------------------------------------color----------------------------------------->
Color kPrimaryColor = Color(0xffFFFBFB);
Color kSecondaryColor = Color(0xff4DC5F9); //text
Color kSecondaryColor2=Color(0xff70D5F6);
Color kSecondaryColor3=Color(0xff5EDEFA);
Color kAccentColor=Color(0xffFBC505); //text
//Color kBackgroundColors = Color(0xFFF8FEFF);
Color kAccentColor2=Color(0xffFFE70D);  //gradient
Color kAccentColor3=Color(0xffFF9E0D);   //gradient
Color kdarkTextColor=Color(0xff000000);

LinearGradient kBgGradient = LinearGradient(
  colors: [
    kSecondaryColor3,
    kPrimaryColor
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient kAccentGradient = LinearGradient(
  colors: [
    kAccentColor2,
    kAccentColor3
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient kCardGradient = LinearGradient(
  colors: [
    kSecondaryColor2,
    kSecondaryColor,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

//<----------------------------------fontstyle---------------------------------------------------->


class AppConstants {
  // Fonts
  static TextStyle kProfileText = GoogleFonts.sirinStencil(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color: Colors.black, // Adjust text color as needed
  );

  static TextStyle kText = GoogleFonts.robotoFlex(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color: Colors.black, // Adjust text color as needed
  );

  static TextStyle kText2 = GoogleFonts.rocknRollOne(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

  static TextStyle kText3 = GoogleFonts.quando(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

  static TextStyle kText4 = GoogleFonts.quando(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

  static TextStyle kText5 = GoogleFonts.russoOne(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

  static TextStyle kText6 = GoogleFonts.novaCut(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

}


//<-------------------------------------------------images------------------------------------------------->

String cowboyEmojiImg="assets/cowboyEmoji.png";
String hourglassImg="assets/hourglass.png";
String winkEmojiImg="assets/winkEmoji.png";
String fireEmoImg="assets/fireEmoji.png";
String heartEyeEmoImg="assets/heartEyeEmoji.png";
String littleSmileEmoImg="assets/littleSmileEmoji.png";
String smileEmoImg="assets/smilingEmoji.png";
String sunglassEmoImg="assets/sunglassEmoji.png";
String thinkEmoImg="assets/thinkingEmoji.png";
String pleadEmoImg="assets/pleadEmoji.png";




//<----------------------------------------------------icons--------------------------------------------------->

class AppIcons {


  static  Icon home = Icon(FontAwesome.house, size:40,weight:20,shadows: [Shadow(color: Colors.black,blurRadius: 5)]);
  static  Icon profile = Icon(FontAwesome.user_large, size:40,shadows: [Shadow(color: Colors.black,blurRadius: 5)]);
  static  Icon save = Icon(FontAwesome.book_bookmark, size:34,color: kPrimaryColor,);
  static  Icon unsaved = Icon(FontAwesome.bookmark, size:33,color: kPrimaryColor,);
  static  Icon share = Icon(FontAwesome.share_nodes, size:28,color: kPrimaryColor,);
  static  Icon voice = Icon(FontAwesome.microphone_lines, size:28,color: kPrimaryColor,);
  static  Icon leftArrow = Icon(FontAwesome.circle_chevron_left, size:36,color: kSecondaryColor,shadows: [Shadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5)]);
  static  Icon rightArrow = Icon(FontAwesome.circle_chevron_right, size:36,color: kSecondaryColor,shadows: [Shadow(color:Colors.grey.withOpacity(0.3), blurRadius: 5)]);
  static  Icon sortAcc = Icon(FontAwesome.arrow_up_short_wide, size:35,shadows: [Shadow(color: Colors.black, blurRadius: 5)]);
  static  Icon sortDes = Icon(FontAwesome.arrow_down_wide_short, size:35,shadows: [Shadow(color: Colors.black, blurRadius: 5)]);
  static  Icon add = Icon(FontAwesome.plus, size:35,shadows: [Shadow(color: Colors.black, blurRadius: 5)]);
  static  Icon back = Icon(FontAwesome.arrow_left, size:35,shadows: [Shadow(color: Colors.black, blurRadius: 5)]);

}


