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
