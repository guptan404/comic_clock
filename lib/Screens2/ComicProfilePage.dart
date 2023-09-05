import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../Providers/JokeProvider.dart';
import '../Providers/ThemeProvider.dart';
import '../Widgets/AppBar.dart';

class ComicProfilePage extends StatefulWidget {
  const ComicProfilePage({Key? key}) : super(key: key);

  @override
  State<ComicProfilePage> createState() => _ComicProfilePageState();
}

class _ComicProfilePageState extends State<ComicProfilePage> {
  @override

  String _selectedTheme = 'comic';
  Widget build(BuildContext context) {

    return  Consumer2<JokeProvider,ThemeProvider>(
        builder: (_,jokeProvider,themeProvider,__) {
          _selectedTheme = themeProvider.theme;
          {
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  color: cSecondaryColor,
                  image: DecorationImage(
                    image: AssetImage(profilePageImg),
                    // Image asset as the background
                    fit: BoxFit.cover, // You can adjust the fit as needed
                  ),
                  //borderRadius: BorderRadius.circular(20),
                ),

                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top:110 ,
                      child:
                        Container(
                      width: 130, // Adjust the width as needed
                      height: 110, // Adjust the height as needed
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(roundSpeechImg),
                          // Replace with your image asset
                          fit: BoxFit.fill, // You can adjust the fit as needed
                        ),
                      ),
                      child: Center(
                        child: Text('Smiles Steve',style: AppConstants.comicSubHead.copyWith(fontSize: 20),softWrap: true,),
                      ),

                    ),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 45,),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black, // Text color
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Comic',
                                    style: AppConstants.comicHeading.copyWith(fontSize: 50)
                                ),
                                TextSpan(text: '\n'), // New line
                                TextSpan(
                                  text: 'clock',
                                  style: AppConstants.comicSubHead.copyWith(fontSize: 35),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: 220, // Adjust the width as needed
                          height: 220, // Adjust the height as needed
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(collisionBox),
                              // Replace with your image asset
                              fit: BoxFit.fill, // You can adjust the fit as needed
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${jokeProvider.curentStreak} ",
                                  style: AppConstants.comicSubHead.copyWith(fontSize: 33,fontWeight: FontWeight.bold,color: Colors.black),),
                               // AppIcons.bomb,
                                Text('Giggle', style:
                                AppConstants.comicSubHead.copyWith(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),),
                                  Text('Streak', style:
                                  AppConstants.comicSubHead.copyWith(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black))
                              ],
                            ),
                          ),

                        ),
                        SizedBox(height: 45,),
                        Center(
                          child: Container(
                            width: 250, // Adjust the width as needed
                            height:200, // Adjust the height as needed
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(yellowRoundSpeech),

                                scale: 0.6,
                                // Replace with your image asset
                                fit: BoxFit.fill, // You can adjust the fit as needed
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        activeColor: kdarkTextColor,
                                        focusColor: kdarkTextColor,
                                      ),
                                      Text('Cartoon', style: AppConstants.comicSubHead.copyWith(color: kdarkTextColor, fontSize: 26)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Radio(
                                        value: 'comic',
                                        groupValue: _selectedTheme, // Use the same variable to track the selected theme
                                        onChanged: (value) {
                                          setState(() {
                                            themeProvider.changeTheme(value!);
                                            _selectedTheme = value!; // Update the selected theme to "comic"
                                          });
                                        },
                                        activeColor: kdarkTextColor,
                                        focusColor: kdarkTextColor,
                                      ),
                                      Text('Comic    ', style: AppConstants.comicSubHead.copyWith(color: kdarkTextColor, fontSize: 26)),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),

                        // Add your _thoughtBubble widget here
                        // Add more widgets as needed
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        }
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
