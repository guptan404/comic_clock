import 'package:comic_clock/Providers/JokeProvider.dart';
import 'package:comic_clock/Providers/ThemeProvider.dart';
import 'package:comic_clock/Screens/BottomBar.dart';
import 'package:comic_clock/Screens2/ComicBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/CustomShape.dart';
import '../Widgets/EmojiContainer.dart';
import '../Widgets/ListCardContainer.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  late bool loading;

  @override
  initState()
  {
    super.initState();
    loading=true;
    getJokesData();
  }

  Future<void> getJokesData()
  async {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    await themeProvider.getFontFromSharedPrefrences();
    JokeProvider jokeProvider = Provider.of<JokeProvider>(context,listen: false);
    await jokeProvider.getJokesFromSharedPrefrences();
    await jokeProvider.calculateStreak();
    loading =false;
    // jokeProvider.getJokeEveryMinute();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading?Center(
        child: EmojiContainer(context, 'random',''),
      ):Consumer<ThemeProvider>(
        builder: (_,themeProvider, __) {
          return themeProvider.theme=="cartoon"?BottomBar():ComicBottomBar();
        }
      )
      );
  }
}
