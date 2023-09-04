import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/constants.dart';

class ThemeProvider extends ChangeNotifier {

  TextStyle selectedFont = GoogleFonts.robotoFlex(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor
    //color: Colors.black, // Adjust text color as needed
  );

  String cf = "Roboto Flex";

  Future<void> getFontFromSharedPrefrences()
  async {
    // get font from shared prefrences
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    String? fontName = sharedPreferences.getString("font");
    if(fontName !=null)
      {
        cf = fontName;
        selectedFont = AppConstants.fonts[cf]!;
      }

  }


  void changeFont(TextStyle font, String fontName) {
    selectedFont = font;
    String cf = fontName;
    SharedPreferences.getInstance().then((value) => value.setString("font", cf));
    notifyListeners();
  }
}