
  import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomAppBar(BuildContext context,String type) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){

              Navigator.pop(context);
            },
            child: Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                color: kPrimaryColor, // Replace with your primary color
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(5, 5), // Adjust the shadow offset
                  ),
                ],
              ),
              child: Center(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return kAccentGradient.createShader(bounds);
                  },
                  child:AppIcons.back,
                ),
              ),
            ),
          ),
          Container(
            width: 200.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: kPrimaryColor, // Replace with your primary color
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(5, 5), // Adjust the shadow offset
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Text',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                color: kPrimaryColor, // Replace with your primary color
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(5, 5), // Adjust the shadow offset
                  ),
                ],
              ),
              child: Center(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return kAccentGradient.createShader(bounds);
                  },
                  child:AppIcons.sortAcc,
                ),
              ),
            ),
          ),
        ],
      );
}

