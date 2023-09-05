import 'dart:typed_data';

import 'package:comic_clock/Providers/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../Model/JokeModel.dart';
import '../Providers/JokeProvider.dart';
import '../Utils/constants.dart';

  Widget CardContainer(BuildContext context,int index,JokeModel joke,bool isFav) {

    String findKeyForJoke(Map<String, List<JokeModel>> jokeListFav, JokeModel jokeToFind) {
      for (var entry in jokeListFav.entries) {
        if (entry.value.contains(jokeToFind)) {
          return entry.key;
        }
      }
      return ''; // Return an empty string if not found
    }

    return Consumer<JokeProvider>(
        builder: (_,jokeProvider, __)  {
          List<JokeModel> favList=jokeProvider.extractAllJokes();
          int? totalSeconds = jokeProvider.jokeList[index].time;
          int minutes = totalSeconds! ~/ 60; // ~/ operator gives you the integer division
          int seconds = totalSeconds % 60;

          String formattedTime = '$minutes:${seconds.toString().padLeft(2,'0')}';
        return Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.56,
          decoration: BoxDecoration(
            gradient: kCardGradient,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            offset: Offset(2, 2), // Shadow offset for bottom and right
            blurRadius: 5,
            ),
          ],
          ),
          child: Consumer<ThemeProvider>(
            builder: (_,themeProvider,__) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //Spacer(),

                      Center(
                        child: Visibility(
                          visible:!((joke.isFavourite??false)||favList.contains(joke)),//not if status is true
                          child:Text(
                            "$formattedTime",// id
                            style: themeProvider.selectedFont, // id
                            // Use your timer text style
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      GestureDetector(
                        onTap: (){
                          if(((joke.isFavourite??false)||favList.contains(joke)))
                              //remove a joke
                           {
                             jokeProvider.removeJokeFromFav(joke, findKeyForJoke(jokeProvider.jokeListFav, joke));
                          Fluttertoast.showToast(
                            msg: 'Removed from Favorites',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: kAccentColor,
                            textColor: Colors.white,
                          );
                           }
                          else{
                          jokeProvider.toggleEmojiListVisibility();
                          }
                        },
                        child: ((joke.isFavourite??false)||favList.contains(joke)) ? AppIcons.save : AppIcons.unsaved,

                      ),
                    ],
                  ),
                ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                         joke.joke??'',
                        style: themeProvider.selectedFont,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        GestureDetector(
                          onTap: () async {
                            _onShare(context,joke.joke??'');
                          },
                          child: AppIcons.share,
                        ),
                        GestureDetector(
                          onTap: (){
                            TextToSpeech textToSpeech = TextToSpeech();
                            textToSpeech.speak(joke.joke??'');
                          },
                          child: AppIcons.voice,
                        ),
                      ],
                    ),
                  ),




                ],
              );
            }
          ),

        );
      }
    );
  }

String subject = 'hello';
String uri = '';
List<String> imageNames = [];
List<String> imagePaths = [];
void _onShare(BuildContext context,String text) async {
  // A builder is used to retrieve the context immediately
  // surrounding the ElevatedButton.
  //
  // The context's `findRenderObject` returns the first
  // RenderObject in its descendent tree when it's not
  // a RenderObjectWidget. The ElevatedButton's RenderObject
  // has its position and size after it's built.
  final box = context.findRenderObject() as RenderBox?;

  if (uri.isNotEmpty) {
    await Share.shareUri(Uri.parse(uri));
  } else if (imagePaths.isNotEmpty) {
    final files = <XFile>[];

      // save the bytes as image file
      // final file = XFile.fromData(bytes!, name: "Joke");
      // files.add(file);
    await Share.shareXFiles(files,
        text: text,
        subject: subject,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  } else {
    await Share.share(text,
        subject: subject,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}


