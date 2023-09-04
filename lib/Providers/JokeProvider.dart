import 'dart:async';
import 'dart:convert';

import 'package:comic_clock/Service/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/JokeModel.dart';

class JokeProvider with ChangeNotifier {
  List<JokeModel> jokeList = [];
  Map<String, List<JokeModel>> jokeListFav = {"😀 All": []};

  JokeService jokeService = JokeService();
  bool isAsc = true;
  int currentIndex = 0;
  int curentStreak = 0;

  bool _isEmojiListVisible = false;

  bool get isEmojiListVisible => _isEmojiListVisible;

  void toggleEmojiListVisibility() {
    _isEmojiListVisible = !_isEmojiListVisible;
    notifyListeners();
  }

  List<JokeModel> extractAllJokes() {
    List<JokeModel> allJokes = [];
    jokeListFav.forEach((emojiTag, jokeList) {
      allJokes.addAll(jokeList);
    });

    return allJokes;
  }

  //get jokeList and jokeListFav from shared preferences


   Future<void> getJokesFromSharedPrefrences() async {
     print("getJokesFromSharedPrefrences is called");
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     String? jokeListString = sharedPreferences.getString("jokeList");
     String? jokeListFavString = sharedPreferences.getString("jokeListFav");
     print("jokeListFav is $jokeListString");
     if (jokeListString != null) {
       List<dynamic> jokeListJson = jsonDecode(jokeListString);
       jokeList = jokeListJson.map((e) => JokeModel.fromJson(e)).toList();
       if(jokeList.length<10)
         {
           jokeList.clear();
           getJokes(10);
         }
       print("jokeList is $jokeList");
       jokeList.forEach((element) {
         Timer.periodic(const Duration(seconds: 1), (timer) {
           element.time = element.time! - 1;
           sharedPreferences.setString("jokeList", jsonEncode(jokeList));
           if(element.time!<=0)
           {
             // jokeList.remove(element);
             sharedPreferences.setString("jokeList", jsonEncode(jokeList));
             getJokes(1);
             timer.cancel();
             notifyListeners();
           }
           notifyListeners();
         });
       });
     }
     else {
       print("else jokeList is null");
       getJokes(10);
     }
     if (jokeListFavString != null) {
        Map<String,dynamic> jokeListFavJson = jsonDecode(jokeListFavString);
        jokeListFavJson.forEach((key, value) {
          List<dynamic> jokeListFavJson = value;
          jokeListFav[key] = jokeListFavJson.map((e) => JokeModel.fromJson(e)).toList();
        });
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

    void removeJokeFromFav(JokeModel jokeModel,String emojiTag) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      jokeListFav[emojiTag]?.remove(jokeModel);
      jokeModel.isFavourite=false;
      sharedPreferences.setString("jokeListFav", jsonEncode(jokeListFav));
      notifyListeners();
    }

    void createNewFavoriteEmoji(String emojiTag) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      jokeListFav[emojiTag] = [];
      sharedPreferences.setString("jokeListFav", jsonEncode(jokeListFav));
      notifyListeners();
    }

    void addJokeToFav(JokeModel jokeModel,String emojiTag) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      if(jokeListFav.containsKey(emojiTag))
      {
        jokeListFav[emojiTag]?.add(jokeModel);
      }
      else
      {
        jokeListFav[emojiTag] = [jokeModel];
      }
      sharedPreferences.setString("jokeListFav", jsonEncode(jokeListFav));
      notifyListeners();
    }

   Future<void> getJokes(int count)
   async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     int jokeTimer=count==1?600:60;
      for (int i = 0; i < count; i++) {
        print("i is $i");
        var value = await jokeService.getJoke();
          if(isAsc){
            jokeList.reversed.toList();
          }
          if(jokeList.length == 10)
          {
            jokeList.removeAt(9);
          }
          value.time= jokeTimer;
          print("value is ${value.toJson()}");
          jokeTimer=jokeTimer+60;
          Timer.periodic(const Duration(seconds: 1), (timer) {
            value.time = value.time! - 1;
            //update time on shared preferences
            sharedPreferences.setString("jokeList", jsonEncode(jokeList));
            if(value.time!<=0)
            {
              // jokeList.remove(value);
              sharedPreferences.setString("jokeList", jsonEncode(jokeList));
              getJokes(1);
              timer.cancel();
              notifyListeners();
            }
            notifyListeners();
          });
          //add joke to starting of the list
          jokeList.insert(0, value);
          //update the shared preferences
          if(isAsc){
            jokeList.reversed.toList();
          }
          sharedPreferences.setString("jokeList", jsonEncode(jokeList));
          notifyListeners();
      }
   }

   //logic to calculate Streak of the user of app opened
    Future<int> calculateStreak()
    async {
      SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
      String? lastOpened = sharedPreferences.getString("lastOpened");
      DateTime now = DateTime.now();
      if(lastOpened==null)
        {
          sharedPreferences.setString("lastOpened", now.toString());
          return 0;
        }
      DateTime lastOpenedDate = DateTime.parse(lastOpened);
      int difference = now.difference(lastOpenedDate).inDays;
      // sharedPreferences.setInt("currentStreak", curentStreak);
      if(difference==0)
        {
          return sharedPreferences.getInt("currentStreak")??0;
        }
      else if(difference==1)
        {
          sharedPreferences.setString("lastOpened", now.toString());
          curentStreak = sharedPreferences.getInt("currentStreak")??0;
          curentStreak++;
          sharedPreferences.setInt("currentStreak", curentStreak);
          return curentStreak;
        }
      else
        {
          sharedPreferences.setString("lastOpened", now.toString());
          curentStreak = 0;
          sharedPreferences.setInt("currentStreak", curentStreak);
          return curentStreak;
        }

    }


  void reverseList() {
    jokeList = jokeList.reversed.toList();
    notifyListeners();
  }
}



