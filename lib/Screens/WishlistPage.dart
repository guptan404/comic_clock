import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  static const String routeName = '/wishlist';
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: kBgGradient
          ),
      ),
    );
  }
}
