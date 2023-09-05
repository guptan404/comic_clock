
  import 'package:comic_clock/Providers/JokeProvider.dart';
import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/GradientIcons.dart';

Widget CustomAppBar(BuildContext context,bool backVisible,bool sortVIsible) {
  JokeProvider jokeProvider = Provider.of<JokeProvider>(context,listen: false);


    return Consumer<JokeProvider>(
      builder: (_,jokeProvider,__) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  replacement: SizedBox.fromSize(child: Container(width: 50,),),
                  visible: backVisible,
                  child: GestureDetector(
                    onTap: (){

                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            //spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(5, 5),
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
              ),
              Container(
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: kPrimaryColor, // Replace with your primary color
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      //spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    logo,

                    height: 50,
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  replacement: SizedBox.fromSize(child: Container(width: 50,),),
                  visible: sortVIsible,
                  child: GestureDetector(
                    onTap: (){

                      jokeProvider.isAsc=(!jokeProvider.isAsc);
                      print(jokeProvider.isAsc);
                      jokeProvider.reverseList();

                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: kPrimaryColor, // Replace with your primary color
                        borderRadius: BorderRadius.circular(15.0),
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
              ),
            ],
          );
      }
    );
}

