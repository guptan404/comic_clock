import 'package:comic_clock/Providers/JokeProvider.dart';
import 'package:flutter/material.dart';

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
      ):Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(60),
            ),
            color: Colors.orange),
        height: 100,
        width: 100,
      ),
      bottomSheet:
      Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: Customshape(),
              child: Container(
                height: 150,
                color: Color.fromRGBO(77, 218, 249, 0.42),
                  width: MediaQuery.of(context).size.width,
                  // decoration: const BoxDecoration(
                  //     borderRadius: BorderRadius.vertical(
                  //       top: Radius.circular(360),
                  //     ),
                  //     color: Colors.orange),

              ),
               ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 150/5.3),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.home),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 150/3),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 150/5.3),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      );
  }
}
