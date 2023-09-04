import 'dart:convert';
import 'dart:typed_data';

import 'package:comic_clock/Screens/JokeCards.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
//import 'package:text_to_speech/text_to_speech.dart';

import '../Providers/JokeProvider.dart';
import '../Utils/constants.dart';
import '../Widgets/AppBar.dart';
import '../Widgets/ListCardContainer.dart';
import 'dart:ui' as ui;

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _visible = true;
  @override
  void initState() {
    super.initState(); //when this route starts, it will execute this code
    Future.delayed(const Duration(seconds: 5), () { //asynchronous delay
      if (this.mounted) { //checks if widget is still active and not disposed
        setState(() { //tells the widget builder to rebuild again because ui has updated
          _visible=false;
          _capturePng();//update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }
    });
  }

  GlobalKey globalKey = GlobalKey();

  Future<void> _capturePng() async {
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    var bs64 = base64Encode(pngBytes);
    // print(pngBytes);
    print("bs64: $bs64");
  }

  @override
  Widget build(BuildContext context) {
    // JokeProvider jokeProvider = Provider.of<JokeProvider>(context,listen: false);
    // jokeProvider.getJokesFromSharedPrefrences();
    final height = MediaQuery.of(context).size.height;
    return RepaintBoundary(
      key: globalKey,
      child: Scaffold(

        body: Container(
          decoration: BoxDecoration(
              gradient: kBgGradient
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 45,),
              CustomAppBar(context,false,true),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Consumer<JokeProvider>(
                  builder: (_,jokeProvider,__) {
                    print("jokeProvider.jokeList.length ${jokeProvider.jokeList.length}");
                    return Container(
                      height: height-250,
                        child: Padding(
                          padding: const EdgeInsets.only(top:0,left: 12.0,right: 12.0),
                          child: ListView.builder(
                            itemCount: jokeProvider.jokeList.length,
                            itemBuilder: (context, index) {
                              final jokeData = jokeProvider.jokeList[index];

                              return GestureDetector(
                                onTap: (){
                                  jokeProvider.currentIndex=index;
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => JokeCard(jokeModel:jokeProvider.jokeList[index],isFav: false,)));},
                                child: ListCardContainer(
                                  jokeModel: jokeData,
                                 index: index,
                                  isFav: false,
                                )
                              );

                            },
                          ),
                        ),);
                  }
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

