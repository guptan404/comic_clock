import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class ComicWishlistPage extends StatefulWidget {
  const ComicWishlistPage({Key? key}) : super(key: key);

  @override
  State<ComicWishlistPage> createState() => _ComicWishlistPageState();
}

class _ComicWishlistPageState extends State<ComicWishlistPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 1st Container with an image
          Container(
            // height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(page4Img),
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
          //SizedBox(height: 10),
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: Text(
                'Your Text Here',
                style: TextStyle(
                  color: cPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 3rd Container with Visibility widget and text

        ],
      ),
    );
  }
}
