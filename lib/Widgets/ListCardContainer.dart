

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/JokeProvider.dart';
import '../Utils/constants.dart';

class ListCardContainer extends StatelessWidget {
  final String id;
  final String joke;
  final String status;

  ListCardContainer({required this.id, required this.joke, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.78,
        height: 100,
        decoration: BoxDecoration(
          color:kPrimaryColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: kAccentColor,
              offset: Offset(5, 5), // Shadow offset for bottom and right
              //blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '00:00', // id
                  style: AppConstants.kText.copyWith(fontSize: 14,color: kAccentColor), // Use your timer text style
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                joke,//joke
                style: AppConstants.kText.copyWith(fontSize: 16,color: kAccentColor),
                textAlign: TextAlign.start,
                //softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,// Display ellipsis for long text
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//fav joke

class JokeListView extends StatefulWidget {
  @override
  _JokeListViewState createState() => _JokeListViewState();
}

class _JokeListViewState extends State<JokeListView> {
  String selectedEmoji = '😀';

  @override
  Widget build(BuildContext context) {
    JokeProvider jokeProvider = Provider.of<JokeProvider>(context);
    final emojiTags = [
      '😀',
      '🤣',
      '😄',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: emojiTags.map((emoji) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedEmoji = emoji;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kPrimaryColor
                ),
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
        // Divider(),
        Container(
          height:  MediaQuery.of(context).size.height * 0.56,
          child: ListView.builder(
            itemCount: jokeProvider.jokeListFav[selectedEmoji]?.length ?? 0,
            itemBuilder: (context, index) {
              final favJoke = jokeProvider.jokeListFav[selectedEmoji]?[index].joke ?? '';

              return ListTile(
                title: Text(favJoke),
                subtitle: Visibility(
                  visible: selectedEmoji == emojiTags[index],
                  child: Text(emojiTags[index]), // Display the selected emoji name
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class JokeListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("object is called");
    JokeProvider jokeProvider = Provider.of<JokeProvider>(context,listen: false);
    jokeProvider.getJokesFromSharedPrefrences();
    return Padding(
      padding: const EdgeInsets.only(top:10,left: 10.0,right: 10.0),
      child: ListView.builder(
        itemCount: jokeProvider.jokeList.length,
        itemBuilder: (context, index) {
          final jokeData = jokeProvider.jokeList[index];
          final id = jokeData.id;
          final joke = jokeData.joke;
          final status = jokeData.status;

          return InkWell(
            onTap: (){
              jokeProvider.addJokeToFav(jokeData, "😀");
            },
            child: ListCardContainer(
              id: id??"",
              joke: joke??"",
              status: status??"",
            ),
          );
        },
      ),
    );
  }
}



