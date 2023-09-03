import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final int id;
  final String joke;
  final bool status;

  CardContainer({required this.id, required this.joke, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.56,
      decoration: BoxDecoration(
        gradient: kCardGradient,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){},
            child: Positioned(
                top: 10,
                right: 10,
                child: AppIcons.unsaved//status==true? AppIcons.save:AppIcons.unsaved
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Text(
              'Your Text Here',//joke
              style: AppConstants.kText,
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Positioned(
                bottom: 10,
                left: 10,
                child: AppIcons.share
            ),
          ),

          GestureDetector(
            onTap: (){},
            child: Positioned(
              bottom: 10,
              right: 10,
              child: AppIcons.voice,
            ),
          ),

          Visibility(
            visible:true//not if status is true
          Positioned(//
            top: 10,
            left: (MediaQuery.of(context).size.width * 0.75 - 20) / 2,
            child: Text(
              '00:00', // id
              style: AppConstants.kText, // Use your timer text style
            ),
          ),
          ),
        ],
      ),

    );
  }
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
