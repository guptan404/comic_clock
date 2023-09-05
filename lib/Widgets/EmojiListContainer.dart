
import 'package:comic_clock/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Providers/JokeProvider.dart';
void _showEmojiInputDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return EmojiInputDialog(context); // Your Emoji Input Dialog
    },
  );
}

Widget EmojiListContainer (BuildContext context,int ind) {
  final jokeProvider = Provider.of<JokeProvider>(context);
  final emojis = jokeProvider.jokeListFav.keys.toList();
  print("emojis.length: ${emojis.length}");

  double offset = emojis.length==1?13:0;

  return Container(
    // color: kPrimaryColor,
    height: 45,
    width: (56.0*(emojis.length))+offset,
    constraints: BoxConstraints(
      maxWidth: 200.0, // Adjust the maximum width as needed
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
          Container(
            //color: Colors.red,
            width: 40.0*(emojis.length*0.8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: emojis.length,
              itemBuilder: (context, index) {
                final emoji = emojis[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: (){
                      print("index: $ind");
                      jokeProvider.addJokeToFav(jokeProvider.jokeList[ind], emoji);
                      jokeProvider.jokeList[ind].isFavourite = true;
                      Fluttertoast.showToast(
                        msg: 'Saved to Favorites',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: kAccentColor,
                        textColor: Colors.white,
                      );
                      jokeProvider.toggleEmojiListVisibility();
                    },
                      child: Text(emojis.isNotEmpty ? emoji.split(' ')[0] : '',style: AppConstants.kText,)), // You can replace Text with your Emoji widget
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              _showEmojiInputDialog(context);
              print('nikhil');
            },
            child: AppIcons.add,
          ),
        ],
      ),
    ),
  );
}

Widget EmojiInputDialog(BuildContext context) {
  String emoji = ''; // Store the emoji input
  String emojiName = ''; // Store the emoji name input

  final OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: kSecondaryColor), // Customize the border color
    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
  );

  return Dialog(
    //backgroundColor: Colors.white, // White background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0), // Rounded corners
    ),
    elevation: 10,
    shadowColor: Colors.grey,

    child: Container(
      height: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            offset: Offset(2, 2), // Shadow offset for bottom and right
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
             opacity: 0.3,
              child: Image.asset(smileEmoImg)),
          Row(
            children: [
              Spacer(),
              Opacity(
                  opacity: 0.3,
                  child: Image.asset(smileEmoImg)),
            ],
          ),
        ],
      ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Add Your Emoji',
                  style: AppConstants.kProfileText.copyWith(color: kSecondaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kAccentColor), // Add a border
                    borderRadius: BorderRadius.circular(8.0), // Adjust the border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      maxLength: 1,
                      cursorColor: kAccentColor,
                      decoration: InputDecoration(
                        labelText: 'Emoji',
                        labelStyle: TextStyle(color:kAccentColor,decorationColor: kAccentColor),
                        border: InputBorder.none, // Remove underline
                      ),
                      onChanged: (value) {
                        emoji = value;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kAccentColor), // Add a border
                    borderRadius: BorderRadius.circular(8.0), // Adjust the border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      cursorColor: kAccentColor,
                      decoration: InputDecoration(
                        labelText: 'Emoji Name',
                        labelStyle   : TextStyle(color:kAccentColor,decorationColor: kAccentColor),
                        border: InputBorder.none, // Remove underline
                      ),
                      onChanged: (value) {
                        emojiName = value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Validate and save the emoji and emoji name
                  if (emoji.isNotEmpty && emojiName.isNotEmpty) {
                    final jokeProvider =
                    Provider.of<JokeProvider>(context, listen: false);
                    jokeProvider.createNewFavoriteEmoji("$emoji $emojiName");

                    Navigator.of(context).pop(); // Close the dialog
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: kAccentColor, // Button color
                ),
                child: Text(
                  'Save',
                  style: AppConstants.kText,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    ),
  );
}

