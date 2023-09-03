import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: kBgGradient
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  CustomAppBar(context,''),
                  Container(
                    height: height-242,
                      child: JokeListView2()),
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
      ),
    );
  }
}
