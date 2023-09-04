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
  @override
  Widget build(BuildContext context) {
    JokeProvider jokeProvider =
        Provider.of<JokeProvider>(context, listen: false);
    jokeProvider.getJokesFromSharedPrefrences();
    final height = MediaQuery.of(context).size.height;
    final emojiTags = [
      '😀',
      '🤣',
      '😄',
    ];
    String selectedEmoji = '😀';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: kBgGradient),
        child: Stack(
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   color: Colors.transparent,
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           //SizedBox(width: 5),
            //           Opacity(
            //             opacity: 0.3,
            //             child: Image.asset(
            //               cowboyEmojiImg,
            //               width: 120,
            //               height: 120,
            //             ),
            //           ),
            //           SizedBox(height: 10), // Add SizedBox for vertical spacing
            //         ],
            //       ),
            //       // Add SizedBox for horizontal spacing
            //       Row(
            //         children: [
            //          Spacer(),
            //           Opacity(
            //             opacity: 0.7,
            //             child: Image.asset(
            //               hourglassImg,
            //               width: 80,
            //               height: 80,
            //             ),
            //           ),
            //           SizedBox(height: 10), // Add SizedBox for vertical spacing
            //         ],
            //       ),
            //       SizedBox(width: 40), // Add SizedBox for horizontal spacing
            //       Row(
            //         children: [
            //           SizedBox(width: 40),
            //           Opacity(
            //             opacity: 0.8,
            //             child: Image.asset(
            //               winkEmojiImg,
            //               width: 70,
            //               height: 70,
            //             ),
            //           ),
            //           // Add SizedBox for vertical spacing
            //         ],
            //       ),
            //       SizedBox(width: 10), // Add SizedBox for horizontal spacing
            //       Row(
            //         children: [
            //           Opacity(
            //             opacity: 0.8,
            //             child: Image.asset(
            //               fireEmoImg,
            //               width: 60,
            //               height: 60,
            //             ),
            //           ),
            //           SizedBox(height: 80), // Add SizedBox for vertical spacing
            //         ],
            //       ),
            //       SizedBox(width: 10), // Add SizedBox for horizontal spacing
            //       // Add more columns and SizedBox widgets as needed
            //     ],
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45,
                ),
                CustomAppBar(context, false, true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: emojiTags.map((emoji) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedEmoji = emoji;
                          print(selectedEmoji);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kPrimaryColor),
                        child: Row(
                          children: [
                            Text(
                              emoji,
                              style: TextStyle(fontSize: 30),
                            ),
                            Visibility(
                              visible: selectedEmoji == emoji,
                              child: Text(
                                'emoji', // Emoji name
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Consumer<JokeProvider>(builder: (_, jokeProvider, __) {
                    print(
                        "jokeProvider.jokeList.length ${jokeProvider.jokeList.length}");
                    return Container(
                      height: height - 280,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 0, left: 12.0, right: 12.0),
                        child: ListView.builder(
                          itemCount: jokeProvider.jokeList.length,
                          itemBuilder: (context, index) {
                            final jokeData = jokeProvider.jokeList[index];
                            final id = jokeData.id;
                            final joke = jokeData.joke;
                            final status = jokeData.status;

                            return GestureDetector(
                                onTap: () {
                                  jokeProvider.currentIndex = index;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => JokeCard(
                                                isFav: true,
                                              )));
                                },
                                child: ListCardContainer(
                                  index: index,
                                ));
                          },
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
