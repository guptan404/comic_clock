import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:comic_clock/Widgets/EmojiListContainer.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../Model/JokeModel.dart';
import '../Providers/JokeProvider.dart';
import '../Utils/constants.dart';
import '../Widgets/AppBar.dart';
import '../Widgets/CardContainer.dart';
import '../Widgets/EmojiContainer.dart';
import '../Widgets/ListCardContainer.dart';

class JokeCard extends StatefulWidget {
  final bool isFav;
  JokeModel jokeModel;

   JokeCard({required this.isFav,Key? key,required this.jokeModel}) : super(key: key);

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  bool _visible = true;
  @override
  void initState() {
    super.initState();
    //when this route starts, it will execute this code
    Future.delayed(const Duration(seconds: 5), () { //asynchronous delay
      if (this.mounted) { //checks if widget is still active and not disposed
        setState(() { //tells the widget builder to rebuild again because ui has updated
          _visible=false;
          //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }
    });
  }

  GlobalKey globalKey = GlobalKey();


  List<Widget> _getRandomEmojis() {
    final List<String> emojis = ['😀', '😂', '😎', '🥳', '😊', '😜', '🤩', '😇', '🤔'];

    // Shuffle the list of emojis randomly
    emojis.shuffle();

    // Generate a list of Text widgets for each emoji
    return emojis.map((emoji) {
      return Text(
        emoji,
        style: TextStyle(fontSize: 30),
      );
    }).toList();
  }


  //int currentIndex=index;
  @override
  Widget build(BuildContext context) {

    JokeProvider jokeProvider = Provider.of<JokeProvider>(context,listen: false);
    if (jokeProvider.currentIndex != null && jokeProvider.jokeList != null &&
        jokeProvider.currentIndex < jokeProvider.jokeList.length) {
      return Consumer<JokeProvider>(
          builder: (_, jokeProvider, __) {
            final currentIndex = jokeProvider.currentIndex;
            List<JokeModel>()=jokeProvider.extractAllJokes();

            return Scaffold(
                resizeToAvoidBottomInset:false,
              body: Container(
                  decoration: BoxDecoration(
                      gradient: kBgGradient
                  ),
                  child: Stack(
                    children: [
                      EmojiContainer(context, 'random',''),
                      Column(
                        children: [
                          SizedBox(height: 45,),
                          CustomAppBar(context, true, false),
                          SizedBox(height: 45,),
                          Padding(
                            padding: const EdgeInsets.only(right: 48.0),
                            child: Row(
                              children: [
                                Spacer(),
                                Visibility(
                                  //replacement: SizedBox.expand(),
                                  visible: jokeProvider.isEmojiListVisible,
                                    child: EmojiListContainer(context,currentIndex)),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          CardContainer(
                            context, currentIndex , widget.jokeModel ??JokeModel() , widget.isFav,),
                          SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {

                                      });
                                      final newIndex = jokeProvider.jokeList.indexOf(widget.jokeModel) - 1;

                                      if (newIndex >= 0) {
                                        jokeProvider.currentIndex = newIndex;
                                        widget.jokeModel=jokeProvider.jokeList[jokeProvider.jokeList.indexOf(widget.jokeModel) - 1];
                                      }
                                      else{
                                        // jokeProvider.currentIndex = jokeProvider.jokeList.length;
                                      }
                                    },
                                    child: AppIcons.leftArrow),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {

                                      });
                                      final newIndex = jokeProvider.jokeList.indexOf(widget.jokeModel) + 1;
                                      if (newIndex < jokeProvider.jokeList.length) {
                                        jokeProvider.currentIndex = newIndex;
                                        widget.jokeModel=jokeProvider.jokeList[jokeProvider.jokeList.indexOf(widget.jokeModel) + 1];
                                      }
                                      else{
                                        jokeProvider.currentIndex = 0;
                                      }
                                    },
                                    child: AppIcons.rightArrow)
                              ],
                            ),
                          ),


                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Visibility(
                          visible: _visible,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              DelayedWidget(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset("assets/laugh.gif",height: 50,width: 50,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                                    ],
                                  ),
                                  delayDuration: Duration(milliseconds: 100),// Not required
                                  animationDuration: Duration(seconds: 1),// Not required
                                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM
                              ),
                              DelayedWidget(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset("assets/laugh.gif",height: 50,width: 50,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                                      Image.asset("assets/laugh.gif",height: 50,width: 50,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                                    ],
                                  ),
                                  delayDuration: Duration(milliseconds: 200),// Not required
                                  animationDuration: Duration(seconds: 1),// Not required
                                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM
                              ),
                              DelayedWidget(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset("assets/laugh.gif",height: 50,width: 50,),
                                      Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh.gif",height: 50,width: 50,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh.gif",height: 50,width: 50,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                                    ],
                                  ),
                                  delayDuration: Duration(milliseconds: 200),// Not required
                                  animationDuration: Duration(seconds: 1),// Not required
                                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM
                              ),

                              DelayedWidget(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset("assets/laugh.gif",height: 50,width: 50,),
                                      SizedBox(width: 30,),
                                      Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh.gif",height: 50,width: 50,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                                      Image.asset("assets/laugh.gif",height: 50,width: 50,),
                                      Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh.gif",height: 50,width: 50,),
                                      Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                                    ],
                                  ),
                                  delayDuration: Duration(milliseconds: 1200),// Not required
                                  animationDuration: Duration(seconds: 1),// Not required
                                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM
                              ),

                              DelayedWidget(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh.gif",height: 100,width: 100,),
                                      Image.asset("assets/laugh2.gif",height: 100,width: 100,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh.gif",height: 100,width: 100,),
                                      SizedBox(width: 40,),
                                      Image.asset("assets/laugh2.gif",height: 100,width: 100,),
                                    ],
                                  ),
                                  delayDuration: Duration(milliseconds: 2400),// Not required
                                  animationDuration: Duration(seconds: 1),// Not required
                                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ),


            );
          }
      );
    }
          else {
            return Container();
          }

  }
}
