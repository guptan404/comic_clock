import 'package:flutter/material.dart';

import '../Utils/constants.dart';

// class CardContainer extends StatelessWidget {
//   final String id;
//   final String joke;
//   final bool isFav;
//
//   CardContainer({required this.id, required this.joke, required this.isFav});
//
//   @override
  Widget CardContainer(BuildContext context,String id,String joke,bool isFav) {

    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.56,
      decoration: BoxDecoration(
        gradient: kCardGradient,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
        BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        offset: Offset(2, 2), // Shadow offset for bottom and right
        blurRadius: 5,
        ),
      ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Spacer(),

                Center(
                  child: Visibility(
                    visible:!isFav,//not if status is true
                    child:Text(
                      '00:00', // id
                      style: AppConstants.kText, // Use your timer text style
                    ),
                  ),
                ),
                SizedBox(width: 55,),
                GestureDetector(
                  onTap: (){},
                  child: AppIcons.unsaved,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                 joke,
                style: AppConstants.kText,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                GestureDetector(
                  onTap: (){},
                  child: AppIcons.share,
                ),
                GestureDetector(
                  onTap: (){},
                  child: AppIcons.voice,
                ),
              ],
            ),
          ),




        ],
      ),

    );
  }


