import 'package:flutter/material.dart';

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
  var currentFont = AppConstants.rocknRollOne;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: kBgGradient
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45,),
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
                              Text('Smiles Steve',style: AppConstants.kProfileText,),
                              Center(
                                child: Row(
                                  children: [
                                    Text('1',style: AppConstants.kText,),
                                    Image.asset(
                                      hourglassImg, // Replace with your image asset
                                      height: 35,
                                    ),
                                    Text('Giggle Streak',style: AppConstants.kText,)
                                  ],
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
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 150,
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
                             'Theme',
                            style: AppConstants.kText.copyWith(color: kSecondaryColor),
                          ),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'cartoon',
                          groupValue: 'theme',
                          onChanged: (value) {
                            // Handle the theme selection (cartoon) here
                          },
                          activeColor: kSecondaryColor,
                          focusColor:kSecondaryColor ,
                        ),
                        Text('Cartoon', style: AppConstants.kText.copyWith(color: kdarkTextColor,fontSize: 16)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'comic',
                          groupValue: 'theme',
                          onChanged: (value) {
                            // Handle the theme selection (comic) here
                          },
                          activeColor: kSecondaryColor,
                          focusColor:kSecondaryColor ,
                        ),
                        Text('Comic', style: AppConstants.kText.copyWith(color: kdarkTextColor,fontSize: 16)),

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
                          style: AppConstants.kText.copyWith(color: kSecondaryColor),
                        ),
                      ),
                      //Create a viewpoer to display Font Changes
                      DropdownButton<String>(
                        value: cf, // Set the initial selected value
                        onChanged: (value) {
                          // Handle font selection here
                          AppConstants.fonts.forEach((key, value) {
                            if (value == cf) {
                              setState(() {
                                currentFont = value;
                              });
                            }
                          });
                        },
                        items: [
                          for(var font in AppConstants.fonts.keys)
                            DropdownMenuItem(
                              value: font,
                              child: Text(
                                font,
                                style: AppConstants.fonts[font]!.copyWith(color: kdarkTextColor),
                              ),
                            ),
                        ],
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
                                  offset: Offset(5, 5), // Shadow offset for bottom and right
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
                ),
              ),
      ),
    );
  }
}
