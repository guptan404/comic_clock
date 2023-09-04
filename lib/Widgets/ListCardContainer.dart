

import 'package:comic_clock/Model/JokeModel.dart';
import 'package:comic_clock/Providers/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/JokeProvider.dart';
import '../Utils/constants.dart';

class ListCardContainer extends StatelessWidget {
  int index;
  JokeModel jokeModel;
  bool isFav;

  ListCardContainer({required this.index,required this.isFav,required this.jokeModel});

  @override
  Widget build(BuildContext context) {
    return Consumer2<JokeProvider,ThemeProvider>(
      builder: (_,jokeProvider,themeProvider, __) {
        return Card(
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
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: !isFav,
                      child: Text(
                        "Time Left: "+jokeModel.time.toString(), // id
                        style: themeProvider.selectedFont.copyWith(fontSize: 14,color: kAccentColor), // Use your timer text style
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    jokeModel.joke??'',//joke
                    style: themeProvider.selectedFont.copyWith(fontSize: 16,color: kAccentColor),
                    textAlign: TextAlign.start,
                    //softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,// Display ellipsis for long text
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

//fav joke




