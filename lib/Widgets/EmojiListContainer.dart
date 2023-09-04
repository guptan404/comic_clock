
import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/JokeProvider.dart';

Widget EmojiListContainer (BuildContext context) {
  final jokeProvider = Provider.of<JokeProvider>(context);
  final emojis = jokeProvider.jokeListFav.keys.toList();

  return Container(
    // color: kPrimaryColor,
    height: 45,
    width: 70.0*(emojis.length),
    constraints: BoxConstraints(
      maxWidth: 300.0, // Adjust the maximum width as needed
    ),
    decoration: BoxDecoration(
      color:kPrimaryColor,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          offset: Offset(2, 2),
        ),
      ],
    ),// Adjust the height as needed
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: emojis.length,
              itemBuilder: (context, index) {
                final emoji = emojis[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(emoji,style: AppConstants.kText,), // You can replace Text with your Emoji widget
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: AppIcons.add,
          ),
        ],
      ),
    ),
  );
}

Widget EmojiInputDialog (BuildContext context) {
  String emoji = ''; // Store the emoji input
  String emojiName = ''; // Store the emoji name input

  return Dialog(
    backgroundColor: kPrimaryColor, // White background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Rounded corners
    ),
    elevation: 10,

    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        Center(
          child: Text(
            'Add Your Emoji',
            style: AppConstants.kText.copyWith(color: kSecondaryColor)
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Emoji',
            ),
            onChanged: (value) {
              emoji = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Emoji Name',
            ),
            onChanged: (value) {
              emojiName = value;
            },
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Validate and save the emoji and emoji name
            if (emoji.isNotEmpty && emojiName.isNotEmpty) {
              final jokeProvider = Provider.of<JokeProvider>(context, listen: false);
              jokeProvider.createNewFavoriteEmoji("$emoji $emojiName");

              Navigator.of(context).pop(); // Close the dialog
            }
          },
          style: ElevatedButton.styleFrom(
            primary: kAccentColor, // Button color
          ),
          child: Text('Save'),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            smileEmoImg, // Replace with your image path
            width: 100,
            height: 100,
            color: kPrimaryColor.withOpacity(0.8), // 80% transparent white
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
