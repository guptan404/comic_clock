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


//profile
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 70,
                    transform: Matrix4.rotationZ(0.0873), // 5 degrees in radians
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          'Your Text Here',
                          style: AppConstants.kProfileText,
                        ),
                        Row(
                          children: [
                            Text(
                              '1',
                              style: AppConstants.kText,
                            ),
                            Text(
                              'Giggle streak',
                              style: AppConstants.kText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //img
                ],
              ),
              Text(
                'Theme',
                style: AppConstants.kText,
              ),
              Row(
                children: [
                  Radio(
                    value: 'cartoon',
                    groupValue: 'theme',
                    onChanged: (value) {
                      // Handle the theme selection (cartoon) here
                    },
                    activeColor: kSecondaryColor,
                    focusColor:kSecondaryColor ,
                  ),
                  Text('Cartoon', style: AppConstants.kText.copyWith(color: kdarkTextColor)),
                  Radio(
                    value: 'comic',
                    groupValue: 'theme',
                    onChanged: (value) {
                      // Handle the theme selection (comic) here
                    },
                    activeColor: kSecondaryColor,
                    focusColor:kSecondaryColor ,
                  ),
                  Text('Comic', style: AppConstants.kText.copyWith(color: kdarkTextColor)),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Font',
                style: AppConstants.kText,
              ),
              DropdownButton<String>(
                value: 'option1', // Set the initial selected value
                onChanged: (value) {
                  // Handle font selection here
                },
                items: [
                  DropdownMenuItem(
                    value: 'option1',
                    child: Text('Option 1', style: AppConstants.kText),
                  ),
                  DropdownMenuItem(
                    value: 'option2',
                    child: Text('Option 2', style: AppConstants.kText),
                  ),
                  DropdownMenuItem(
                    value: 'option3',
                    child: Text('Option 3', style: AppConstants.kText),
                  ),
                  DropdownMenuItem(
                    value: 'option4',
                    child: Text('Option 4', style: AppConstants.kText),
                  ),
                  DropdownMenuItem(
                    value: 'option5',
                    child: Text('Option 5', style: AppConstants.kText),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
