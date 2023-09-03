
  import 'package:comic_clock/Providers/JokeProvider.dart';
import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/GradientIcons.dart';

Widget CustomAppBar(BuildContext context,String type,bool backVisible,bool sortVIsible) {
  JokeProvider jokeProvider = Provider.of<JokeProvider>(context,listen: false);
  jokeProvider.getJokesFromSharedPrefrences();

    return Consumer<JokeProvider>(
      builder: (_,jokeProvider,__) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: backVisible,
                child: GestureDetector(
                  onTap: (){

                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: kPrimaryColor, // Replace with your primary color
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          //spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(5, 5), // Adjust the shadow offset
                        ),
                      ],
                    ),
                    child: Center(
                      child:  GradientIcon(
                        AppIcons.back,
                        50,
                        kAccentGradient,
                      )
                    ),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: kPrimaryColor, // Replace with your primary color
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      //spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(5, 5), // Adjust the shadow offset
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Text',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: sortVIsible,
                child: GestureDetector(
                  onTap: (){
                    jokeProvider.isAsc=!jokeProvider.isAsc;
                    jokeProvider.sortingChange(jokeProvider.isAsc);

                  },
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: kPrimaryColor, // Replace with your primary color
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          //spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(5, 5), // Adjust the shadow offset
                        ),
                      ],
                    ),
                    child: Center(
                      child: jokeProvider.isAsc? GradientIcon(
                        AppIcons.sortAcc,
                        50,
                        kAccentGradient,
                      ):GradientIcon(
                        AppIcons.sortDes,
                        50,
                        kAccentGradient,
                      )
                    ),
                  ),
                ),
              ),
            ],
          );
      }
    );
}

