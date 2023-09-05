import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/JokeProvider.dart';
import '../Providers/ThemeProvider.dart';
import '../Utils/constants.dart';
import '../Widgets/AppBar.dart';
import '../Widgets/ListCardContainer.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String cf = AppConstants.fonts.keys.first;
  var currentFont = AppConstants.robotoFlex;
  String _selectedTheme = 'cartoon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: kBgGradient
          ),
          child: Consumer2<JokeProvider,ThemeProvider>(
              builder: (_,jokeProvider,themeProvider,__) {
                _selectedTheme=themeProvider.theme;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 55,),
                  CustomAppBar(context, false, false),
                  SizedBox(height: 55,),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Transform.rotate(
                          angle: -5 * (3.14159265359 / 180),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              gradient: kCardGradient,
                              borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                            BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            offset: Offset(2, 2), // Shadow offset for bottom and right
                            blurRadius: 5,
                          ),],
                            ),
                            child: Transform.rotate(
                              angle: 5 * (3.14159265359 / 180),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5,),
                                  DelayedWidget(
                                      child: Text('Smiles Steve',style: AppConstants.kProfileText,),
                                      delayDuration: Duration(milliseconds: 100),// Not required
                                      animationDuration: Duration(seconds: 1),// Not required
                                      animation: DelayedAnimations.SLIDE_FROM_LEFT,// Not required
                                  ),
                                  SizedBox(height: 5,),
                                  Center(
                                    child: DelayedWidget(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("${jokeProvider.curentStreak} ",style: themeProvider.selectedFont,),
                                          Image.asset(
                                            hourglassImg, // Replace with your image asset
                                            height: 35,
                                          ),
                                          Text(' Giggle Streak',style: themeProvider.selectedFont,)
                                        ],
                                      ),
                                        delayDuration: Duration(milliseconds: 100),// Not required
                                        animationDuration: Duration(seconds: 1),// Not required
                                        animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          cowboyEmojiImg, // Replace with your image asset
                          height: 65,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 45,),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 150,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Theme',
                              style: themeProvider.selectedFont.copyWith(color: kSecondaryColor),
                            ),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 'cartoon',
                                groupValue: _selectedTheme, // Use a variable to track the selected theme
                                onChanged: (value) {
                                  setState(() {
                                    themeProvider.changeTheme(value!);
                                    _selectedTheme = value!; // Update the selected theme to "cartoon"
                                  });
                                },
                                activeColor: kSecondaryColor,
                                focusColor: kSecondaryColor,
                              ),
                              Text('Cartoon', style: themeProvider.selectedFont.copyWith(color: kdarkTextColor, fontSize: 16)),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 'comic',
                                groupValue: _selectedTheme,
                                onChanged: (value) {
                                  setState(() {
                                    themeProvider.changeTheme(value!);
                                    _selectedTheme = value!;
                                  });
                                },
                                activeColor: kSecondaryColor,
                                focusColor: kSecondaryColor,
                              ),
                              Text('Comic', style: themeProvider.selectedFont.copyWith(color: kdarkTextColor, fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 210,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Font',
                              style: themeProvider.selectedFont.copyWith(color: kSecondaryColor),
                            ),
                          ),
                          //Create a viewpoer to display Font Changes
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DropdownButton<String>(
                             // border: Border.all(color: Colors.grey), // Add border decoration
                              borderRadius: BorderRadius.circular(8.0),
                              isExpanded: true, // Set the initial selected value
                              onChanged: (value) {
                                // Handle font selection here
                                themeProvider.cf=value!;
                                  themeProvider.changeFont(currentFont,value!);
                                  currentFont=AppConstants.fonts[value]!;
                              },
                              items: [
                                for (var font in AppConstants.fonts.keys)
                                  DropdownMenuItem(
                                    value: font,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(

                                        decoration: BoxDecoration(
                                          gradient: kAccentGradient,

                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            font,
                                            style: AppConstants.fonts[font]!.copyWith(color: kdarkTextColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          Center(
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.78,
                                height: 100,
                                decoration: BoxDecoration(
                                  color:kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kAccentColor,
                                      offset: Offset(5, 5),
                                      //blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: Text(
                                        "Black holes are where God divided by zero.",//joke
                                        style: currentFont.copyWith(fontSize: 16,color: kAccentColor),
                                        textAlign: TextAlign.start,
                                        //softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,// Display ellipsis for long text
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                      ],
                    );
            }
          ),
              ),
      ),
    );
  }
}
