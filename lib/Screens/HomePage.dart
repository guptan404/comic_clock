import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/JokeProvider.dart';
import '../Utils/constants.dart';
import '../Widgets/AppBar.dart';
import '../Widgets/ListCardContainer.dart';

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
          _visible=false; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    JokeProvider jokeProvider = Provider.of<JokeProvider>(context,listen: false);
    jokeProvider.getJokesFromSharedPrefrences();
    final height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
            gradient: kBgGradient
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            CustomAppBar(context,'',false,true),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Consumer<JokeProvider>(
                builder: (_,jokeProvider,__) {
                  return Container(
                    height: height-250,
                      child: Padding(
                        padding: const EdgeInsets.only(top:0,left: 12.0,right: 12.0),
                        child: ListView.builder(
                          itemCount: jokeProvider.jokeList.length,
                          itemBuilder: (context, index) {
                            final jokeData = jokeProvider.jokeList[index];
                            final id = jokeData.id;
                            final joke = jokeData.joke;
                            final status = jokeData.status;

                            return ListCardContainer(
                              id: id??"",
                              joke: joke??"",
                              status: status??"",
                            );
                          },
                        ),
                      ),);
                }
              ),
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
                            Image.asset("assets/laugh.gif",height: 50,width: 50,),
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
                            Image.asset("assets/laugh.gif",height: 50,width: 50,),
                            Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                            Image.asset("assets/laugh.gif",height: 50,width: 50,),
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
                            Image.asset("assets/laugh.gif",height: 50,width: 50,),
                            Image.asset("assets/laugh2.gif",height: 50,width: 50,),
                            Image.asset("assets/laugh.gif",height: 50,width: 50,),
                            Image.asset("assets/laugh2.gif",height: 50,width: 50,),
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
                            Image.asset("assets/laugh.gif",height: 100,width: 100,),
                            Image.asset("assets/laugh2.gif",height: 100,width: 100,),
                            Image.asset("assets/laugh.gif",height: 100,width: 100,),
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
        ),
      ),
    );
  }
}

