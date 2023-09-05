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

Color cSecondaryColor=Color(0xffFFC545);
Color cPrimaryColor = Color(0xff000000);
Color cAccentColor = Color(0xffFFFBFB);


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

  static TextStyle robotoFlex = GoogleFonts.robotoFlex(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor
  //color: Colors.black, // Adjust text color as needed
  );

  static TextStyle rocknRollOne = GoogleFonts.rocknRollOne(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

  static TextStyle quando = GoogleFonts.quando(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

  static TextStyle quando2 = GoogleFonts.quando(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

  static TextStyle russoOne = GoogleFonts.russoOne(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

  static TextStyle novaCut = GoogleFonts.novaCut(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

  static TextStyle comic = GoogleFonts.comicNeue(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: cPrimaryColor
    //color Colors.black, // Adjust text color as needed
  );

  static Map<String,TextStyle> fonts = {
    'Roboto Flex':AppConstants.robotoFlex,
    'Rockn Roll One':AppConstants.rocknRollOne,
    'Quando':AppConstants.quando,
    'Quando2':AppConstants.quando2,
    'Russo One':AppConstants.russoOne,
    'Nova Cut':AppConstants.novaCut,
  };

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
String logo='assets/Logo.png';
String page1Img='assets/page1.png';
String page2Img='assets/page2.png';
String page3Img='assets/page3.png';
String page4Img='assets/page1.png';
String page5Img='assets/page5.png';
String page6Img='assets/page6.png';
String page7Img='assets/page7.png';
String page8Img='assets/page8.png';
String page9Img='assets/page9.png';
String page10Img='assets/page10.png';

List<String> comicPages=[
  page1Img,
  page2Img,
  page3Img,
  page4Img,
  page5Img,
  page6Img,
  page7Img,
  page8Img,
  page9Img,
  page10Img,
];




//<----------------------------------------------------icons--------------------------------------------------->

class AppIcons {


  static  Icon home = Icon(FontAwesome.house, size:40,weight:20,shadows: [Shadow(color: Colors.black,blurRadius: 5)]);
  static  Icon profile = Icon(FontAwesome.user_large, size:40,shadows: [Shadow(color: Colors.black,blurRadius: 5)]);
  static  Icon save = Icon(Icons.bookmark, size:34,color: kPrimaryColor,);
  static  Icon unsaved = Icon(Icons.bookmark_border_rounded, size:33,color: Colors.black,);
  static  Icon save2 = Icon(Icons.bookmark, size:34,color: Colors.black,);
  static  Icon unsaved2 = Icon(Icons.bookmark_border_rounded, size:33,color: kdarkTextColor,);
  static  Icon share = Icon(FontAwesome.share_nodes, size:28,color: kPrimaryColor,);
  static  Icon voice = Icon(FontAwesome.microphone_lines, size:28,color: kPrimaryColor,);
  static  Icon leftArrow = Icon(FontAwesome.circle_chevron_left, size:36,color: kSecondaryColor,shadows: [Shadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5)]);
  static  Icon rightArrow = Icon(FontAwesome.circle_chevron_right, size:36,color: kSecondaryColor,shadows: [Shadow(color:Colors.grey.withOpacity(0.3), blurRadius: 5)]);
  static  Icon sortAcc = Icon(FontAwesome.arrow_up_short_wide, size:35,shadows: [Shadow(color: Colors.black, blurRadius: 5)]);
  static  Icon sortDes = Icon(FontAwesome.arrow_down_wide_short, size:35,shadows: [Shadow(color: Colors.black, blurRadius: 5)]);
  static  Icon add = Icon(FontAwesome.plus, size:28,shadows: [Shadow(color: Colors.black,)]);
  static  Icon back = Icon(FontAwesome.arrow_left, size:35,shadows: [Shadow(color: Colors.black, blurRadius: 5)]);
  static  Icon bomb = Icon(FontAwesome.bomb, size:35,color: cPrimaryColor,);
  static  Icon cHome = Icon(Icons.home,size:30,color: cPrimaryColor,);
  static  Icon cProfile= Icon(Icons.person_2,size:30,color: cPrimaryColor);

}


