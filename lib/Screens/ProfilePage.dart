import 'package:flutter/material.dart';

import '../Utils/constants.dart';
import '../Widgets/AppBar.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: kBgGradient
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45,),
            CustomAppBar(context, '', false, false),
            SizedBox(height: 85,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 150,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                           'Theme',
                          style: AppConstants.kText.copyWith(color: kSecondaryColor),
                        ),
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
                    ],
                  ),
                  Row(
                    children: [
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
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 100,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Font',
                        style: AppConstants.kText.copyWith(color: kSecondaryColor),
                      ),
                    ),
                    DropdownButton<String>(
                      value: 'option1', // Set the initial selected value
                      onChanged: (value) {
                        // Handle font selection here
                      },
                      items: [
                        DropdownMenuItem(
                          value: 'option1',
                          child: Text('Option 1', style: AppConstants.kText.copyWith(color: kdarkTextColor)),
                        ),
                        DropdownMenuItem(
                          value: 'option2',
                          child: Text('Option 2', style: AppConstants.kText.copyWith(color: kdarkTextColor)),
                        ),
                        DropdownMenuItem(
                          value: 'option3',
                          child: Text('Option 3', style: AppConstants.kText.copyWith(color: kdarkTextColor)),
                        ),
                        DropdownMenuItem(
                          value: 'option4',
                          child: Text('Option 4', style: AppConstants.kText.copyWith(color: kdarkTextColor)),
                        ),
                        DropdownMenuItem(
                          value: 'option5',
                          child: Text('Option 5', style: AppConstants.kText.copyWith(color: kdarkTextColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
                ],
              ),
            ),
    );
  }
}
