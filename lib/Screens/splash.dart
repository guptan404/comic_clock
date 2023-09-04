import 'package:comic_clock/Providers/JokeProvider.dart';
import 'package:comic_clock/Providers/ThemeProvider.dart';
import 'package:comic_clock/Screens/BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/CustomShape.dart';
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
    loading =false;
    // jokeProvider.getJokeEveryMinute();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading?Center(
        child: Text('Splash Screen'),
      ):BottomBar()
      );
  }
}
