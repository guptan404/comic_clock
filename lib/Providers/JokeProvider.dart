import 'dart:async';
import 'dart:convert';

import 'package:comic_clock/Service/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/JokeModel.dart';

class JokeProvider with ChangeNotifier {
  List<JokeModel> jokeList = [];
  List<JokeModel> jokeListFav = [];

  JokeService jokeService = JokeService();

  //get jokeList and jokeListFav from shared preferences

   void getJokesFromSharedPrefrences() async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     String? jokeListString = sharedPreferences.getString("jokeList");
     String? jokeListFavString = sharedPreferences.getString("jokeListFav");
     if (jokeListString != null) {
       List<dynamic> jokeListJson = jsonDecode(jokeListString);
       jokeList = jokeListJson.map((e) => JokeModel.fromJson(e)).toList();
     }
     else {
       getJokes(10);
     }
     if (jokeListFavString != null) {
       List<dynamic> jokeListFavJson = jsonDecode(jokeListFavString);
       jokeListFav = jokeListFavJson.map((e) => JokeModel.fromJson(e)).toList();
     }
     notifyListeners();
   }

   //get a new joke every minute
    void getJokeEveryMinute() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      Timer.periodic(const Duration(seconds: 60), (timer) {
        getJokes(1);
      });
    }

   Future<void> getJokes(int count)
   async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      for (int i = 0; i < count; i++) {
        jokeService.getJoke().then((value) {
          if(jokeList.length == 10)
          {
            jokeList.removeAt(9);
          }
          jokeList.add(value);
          //update the shared preferences
          sharedPreferences.setString("jokeList", jsonEncode(jokeList));
          notifyListeners();
        });
      }
   }
}

class JokeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: JokeProvider.jokelist.length,
      itemBuilder: (context, index) {
        final jokeData = JokeProvider.jokelist[index];
        final id = jokeData['id'];
        final joke = jokeData['joke'];
        final status = jokeData['status'];

        return ListCardContainer(
          id: id,
          text: joke,
          status: status,
        );
      },
    );
  }
}

//joke list
class JokeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: JokeProvider.jokelist.length,
      itemBuilder: (context, index) {
        final jokeData = JokeProvider.jokelist[index];
        final id = jokeData.id;
        final joke = jokeData.joke;
        final status = jokeData.status;

        return ListCardContainer(
          id: id,
          joke: joke,
          status: status,
        );
      },
    );
  }}

//fav joke list
class JokeListView extends StatefulWidget {
  @override
  _JokeListViewState createState() => _JokeListViewState();
}

class _JokeListViewState extends State<JokeListView> {
  String selectedEmoji = '😀';

  @override
  Widget build(BuildContext context) {
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
            itemCount: JokeProvider.jokefavlist[selectedEmoji]?.length ?? 0,
            itemBuilder: (context, index) {
              final favJoke = JokeProvider.jokefavlist[selectedEmoji]?[index] ?? '';

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



