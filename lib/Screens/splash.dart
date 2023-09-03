import 'package:comic_clock/Providers/JokeProvider.dart';
import 'package:flutter/material.dart';

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
    JokeProvider jokeProvider = JokeProvider();
    await jokeProvider.getJokesFromSharedPrefrences();
    loading =false;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading?Center(
        child: Text('Splash Screen'),
      ):JokeListView2(),
    );
  }
}
