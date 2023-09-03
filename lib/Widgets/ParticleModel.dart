import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';

import 'Particles.dart';

class ShowAn extends StatefulWidget {
  const ShowAn({super.key});

  @override
  State<ShowAn> createState() => _ShowAnState();
}

class _ShowAnState extends State<ShowAn> {
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
    int delayAmount = 500;
    return  Scaffold(
      body:
      Visibility(
        visible: _visible,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
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
          ],
        ),
      ),
    );
  }
}
