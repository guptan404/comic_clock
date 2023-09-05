import 'dart:math';

import 'package:comic_clock/Providers/JokeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_flip/page_flip.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../Model/JokeModel.dart';
import '../../Providers/ThemeProvider.dart';
import '../../Utils/constants.dart';
import '../../Widgets/CardContainer.dart';
import '../../Widgets/EmojiListContainer.dart';

class ComicWishlistPage extends StatefulWidget {
  const ComicWishlistPage({Key? key}) : super(key: key);

  @override
  State<ComicWishlistPage> createState() => _ComicWishlistPageState();
}

int index = 0;
String findKeyForJoke(Map<String, List<JokeModel>> jokeListFav, JokeModel jokeToFind) {
  for (var entry in jokeListFav.entries) {
    if (entry.value.contains(jokeToFind)) {
      return entry.key;
    }
  }
  return ''; // Return an empty string if not found
}

final _controller = GlobalKey<PageFlipWidgetState>();
var selectedEmoji = '';
int selectedIndex=0;

class _ComicWishlistPageState extends State<ComicWishlistPage> {
  @override
  Widget build(BuildContext context) {
    JokeProvider jokeProvider = Provider.of<JokeProvider>(context, listen: false);
    return  Scaffold(
      body: jokeProvider.jokeListFav.values.elementAt(selectedIndex).length==0?
          Stack(
            children: [
              Container(
                // height: 200,
                decoration: BoxDecoration(
                  color: cSecondaryColor,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child:Image.asset(bubble,scale: 0.7,),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  width: 200,
                  // color: Colors.red,
                  child: Center(
                    child: Text(
                        "Joke not found, but we found your smile! 😄",
                        style: AppConstants.comic
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
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
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: jokeProvider.jokeListFav.keys.length,
                            itemBuilder: (context, index) {
                              final emoji = jokeProvider.jokeListFav.keys.elementAt(index);
                              final emojiList=emoji.split(' ');
                              // final
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedEmoji = emoji;
                                    selectedIndex=index;
                                    print(selectedEmoji);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8.0),
                                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: kdarkTextColor.withOpacity(0.8),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        " ${emojiList[0]} ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Visibility(
                                        visible: selectedIndex==index,
                                        child: Consumer<ThemeProvider>(
                                            builder: (_,themeProvider,__) {
                                              return Text(
                                                "${emojiList[1]} ",
                                                style: AppConstants.kText.copyWith(color: kPrimaryColor),
                                              );
                                            }
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
          :PageFlipWidget(
          key: _controller,
          index: index,
          children:[
            for(int i=0;i<jokeProvider.jokeListFav.values.elementAt(selectedIndex).length;i++)
              pages(i,selectedIndex)
          ]

      ),
    );
  }
  Random random = Random();
  Widget pages(int index,int selectedIndex)
  {
    int randomNumber = random.nextInt(9);
    return Consumer<JokeProvider>(
        builder: (_,jokeProvider,__) {
          List<JokeModel> favList=jokeProvider.extractAllJokes();
          var joke = jokeProvider.jokeListFav.values.elementAt(selectedIndex)[index];
          return Stack(
            alignment: Alignment.center,
            children: [
              // 1st Container with an image
              Container(
                // height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(comicPages[randomNumber]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 2nd Container with three icons and text
              Positioned(
                top: 70,
                left: 80,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Visibility(
                            //replacement: SizedBox.expand(),
                              visible: jokeProvider.isEmojiListVisible,
                              child: EmojiListContainer(context,index)),
                        ],
                      ),
                    ),

                    SizedBox(height: 5,),
                    Container(
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
                                  print("in else");
                                  jokeProvider.toggleEmojiListVisibility();
                                }
                              },
                              child: ((joke.isFavourite??false)||favList.contains(joke)) ? AppIcons.save2 : AppIcons.unsaved2,
                            ),
                            GestureDetector(
                                onTap:(){
                                  TextToSpeech textToSpeech = TextToSpeech();
                                  textToSpeech.speak(joke.joke??'');
                                },
                                child: Icon(Icons.volume_up, color: Colors.black,size: 30)),
                            GestureDetector(
                                onTap:(){
                                  _onShare(context,joke.joke??'');
                                },
                                child: Icon(Icons.share, color: Colors.black,size: 30)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  // color: Colors.red,
                  child: Text(
                      joke.joke??"",
                      style: AppConstants.comic
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
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
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: jokeProvider.jokeListFav.keys.length,
                            itemBuilder: (context, index) {
                              final emoji = jokeProvider.jokeListFav.keys.elementAt(index);
                              final emojiList=emoji.split(' ');
                              // final
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedEmoji = emoji;
                                    selectedIndex=index;
                                    print(selectedEmoji);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8.0),
                                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: kdarkTextColor.withOpacity(0.8),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        " ${emojiList[0]} ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Visibility(
                                        visible: selectedIndex==index,
                                        child: Consumer<ThemeProvider>(
                                            builder: (_,themeProvider,__) {
                                              return Text(
                                                "${emojiList[1]} ",
                                                style: AppConstants.kText.copyWith(color: kPrimaryColor),
                                              );
                                            }
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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

  void _onShare(BuildContext context,String text) async {

    final box = context.findRenderObject() as RenderBox?;

    if (uri.isNotEmpty) {
      await Share.shareUri(Uri.parse(uri));
    } else if (imagePaths.isNotEmpty) {
      final files = <XFile>[];


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
