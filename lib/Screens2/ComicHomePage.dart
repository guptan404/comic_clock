import 'dart:math';

import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../Utils/listEnum.dart';
import '../Widgets/CardContainer.dart';

class ComicHomePage extends StatefulWidget {
  const ComicHomePage({Key? key}) : super(key: key);

  @override
  State<ComicHomePage> createState() => _ComicHomePageState();
}

class _ComicHomePageState extends State<ComicHomePage> {
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    int randomNumber = random.nextInt(9);
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 1st Container with an image
          Container(
           // height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(page9Img),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2nd Container with three icons and text
          Positioned(
            top: 70,
            left: 80,
            child: Container(
              decoration: BoxDecoration(
                color: cAccentColor,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 5.0, // Border width
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap:(){
                          // if(((joke.isFavourite??false)||favList.contains(joke)))
                          //   //remove a joke
                          //     {
                          //   jokeProvider.removeJokeFromFav(joke, findKeyForJoke(jokeProvider.jokeListFav, joke));
                          //   Fluttertoast.showToast(
                          //     msg: 'Removed from Favorites',
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.BOTTOM,
                          //     backgroundColor: kAccentColor,
                          //     textColor: Colors.white,
                          //   );
                          // }
                          // else{
                          //   jokeProvider.toggleEmojiListVisibility();
                          // }
                        },
                        child: Icon(Icons.bookmark_border, color: Colors.black,size: 30,)),
                    GestureDetector(
                        onTap:(){
                          // TextToSpeech textToSpeech = TextToSpeech();
                          // textToSpeech.speak(joke.joke??'');
                        },
                        child: Icon(Icons.volume_up, color: Colors.black,size: 30)),
                    GestureDetector(
                        onTap:(){
                          // _onShare(context,joke.joke??'');
                        },
                        child: Icon(Icons.share, color: Colors.black,size: 30)),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
                bottom: 10,
                right: 30,
                child: GestureDetector(
                    onTap: (){},
                    child:Icon(Icons.arrow_circle_right_sharp, color: Colors.white,size: 40)),
          ),
          //SizedBox(height: 10),
          Center(
            child: Container(
              height: 200,
              width: 200,
              //color: Colors.red,
              child: Text(
                'Your Text Here',
                style: AppConstants.comic
              ),
            ),
          ),
          Positioned(
            bottom: 10,
              left: 30,
              child: GestureDetector(
                  onTap: (){},
                  child: Icon(Icons.arrow_circle_left_sharp, color: Colors.white,size: 40))),
          // 3rd Container with Visibility widget and text
          Positioned(
            bottom: 60,
            left: 170,
            child: Visibility(
              visible: true, // Set this to control visibility
              child: Container(
                decoration: BoxDecoration(
                  color: cAccentColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 5.0, // Border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '00:8',
                    style: AppConstants.comic.copyWith(fontSize: 30)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
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



}