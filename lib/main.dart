import 'package:comic_clock/Providers/ThemeProvider.dart';
import 'package:comic_clock/Screens/splash.dart';
import 'package:comic_clock/Screens/cartoon/BottomBar.dart';
import 'package:comic_clock/Screens/comic/ComicBottomBar.dart';
import 'package:comic_clock/Widgets/ListCardContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/JokeProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider<JokeProvider>(
        create: (_) => JokeProvider(),
    ),
    ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(),
    )
    ],
      child:
         MaterialApp(
          title: 'Comic Clock',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
           // onGenerateRoute: (settings) => generateRoute(settings),
          ),
          home: Splash(),
        )
    );
  }
}