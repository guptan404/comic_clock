import 'package:comic_clock/Providers/ThemeProvider.dart';
import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/JokeProvider.dart';
import '../Widgets/AppBar.dart';
import '../Widgets/ListCardContainer.dart';
import 'JokeCards.dart';

class WishlistPage extends StatefulWidget {
  static const String routeName = '/wishlist';
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    JokeProvider jokeProvider =
        Provider.of<JokeProvider>(context, listen: false);
    // jokeProvider.getJokesFromSharedPrefrences();
    final height = MediaQuery.of(context).size.height;

    String selectedEmoji = jokeProvider.jokeListFav.keys.elementAt(0);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: kBgGradient),
        child: Stack(
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 55,
                ),
                CustomAppBar(context, false, false),
                SizedBox(
                  height: 5,
                ),
                Container(
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
                          margin: EdgeInsets.all(8.0), // Add margin between items
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0), // Add padding to each item
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kPrimaryColor,
                          ),
                          child: Row(
                            children: [
                              Text(
                                emojiList[0],
                                style: TextStyle(fontSize: 20),
                              ),
                              Visibility(
                                visible: selectedIndex==index,
                                child: Consumer<ThemeProvider>(
                                  builder: (_,themeProvider,__) {
                                    return Text(
                                      emojiList[1],
                                      style: AppConstants.kText.copyWith(color: kdarkTextColor),
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

                Consumer<JokeProvider>(builder: (_, jokeProvider, __) {
                  print(
                      "jokeProvider.jokeList.length ${jokeProvider.jokeList.length}");
                  return Container(
                    height: height - 280,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 12.0, right: 12.0),
                      child: ListView.builder(
                        itemCount: jokeProvider.jokeListFav.values.elementAt(selectedIndex).length,
                        itemBuilder: (context, index) {
                          final jokeData = jokeProvider.jokeListFav.values.elementAt(selectedIndex)[index];


                          return GestureDetector(
                              onTap: () {
                                jokeProvider.currentIndex = index;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JokeCard(
                                              jokeModel: jokeData,
                                              isFav: true,
                                            )));
                              },
                              child: ListCardContainer(
                                index: index,
                                jokeModel:jokeData,
                                isFav:true
                              ));
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
