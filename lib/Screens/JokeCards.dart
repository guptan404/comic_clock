import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/JokeProvider.dart';
import '../Utils/constants.dart';
import '../Widgets/AppBar.dart';
import '../Widgets/CardContainer.dart';
import '../Widgets/ListCardContainer.dart';

class JokeCard extends StatefulWidget {
  final bool isFav;

   JokeCard({required this.isFav,Key? key}) : super(key: key);

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  //int currentIndex=index;
  @override
  Widget build(BuildContext context) {
    JokeProvider jokeProvider = Provider.of<JokeProvider>(context,listen: false);
    final currentIndex = jokeProvider.currentIndex;
    final jokeData = jokeProvider.jokeList[currentIndex];
    final id = jokeData.id;
    final joke = jokeData.joke;
    final status = jokeData.status;


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: kBgGradient
        ),
          child:Column(
            children: [
              SizedBox(height: 45,),
              CustomAppBar(context,'',true,false),
              SizedBox(height: 85,),
              CardContainer(
                context, id??"", joke??"", widget.isFav,),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        final newIndex = currentIndex - 1;
                        if (newIndex >= 0) {
                          jokeProvider.currentIndex = newIndex;
                        }
                      },
                        child: AppIcons.leftArrow),
                    GestureDetector(
                        onTap: (){
                          final newIndex = currentIndex + 1;
                          if (newIndex < jokeProvider.jokeList.length) {
                            jokeProvider.currentIndex = newIndex;
                          }
                        },
                        child: AppIcons.rightArrow)
                  ],
                ),
              )

            ],
          )
      ),



    );
  }
}
