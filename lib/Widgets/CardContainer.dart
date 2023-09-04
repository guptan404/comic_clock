import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../Providers/JokeProvider.dart';
import '../Utils/constants.dart';

// class CardContainer extends StatelessWidget {
//   final String id;
//   final String joke;
//   final bool isFav;
//
//   CardContainer({required this.id, required this.joke, required this.isFav});
//
//   @override
// WidgetsToImageController to access widget
WidgetsToImageController controller = WidgetsToImageController();
// to save image bytes of widget
Uint8List? bytes;
  Widget CardContainer(BuildContext context,int index,String joke,bool isFav) {

    return Consumer<JokeProvider>(
        builder: (_,jokeProvider, __)  {
        return WidgetsToImage(
          controller: controller,
          child: Container(
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
                            "Time Left: "+jokeProvider.jokeList[index].time.toString(), // id
                            style: AppConstants.kText, // id
                            // Use your timer text style
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
                        onTap: () async {
                          _onShare(context,joke);
                        },
                        child: AppIcons.share,
                      ),
                      GestureDetector(
                        onTap: (){
                          TextToSpeech textToSpeech = TextToSpeech();
                          textToSpeech.speak(joke);
                        },
                        child: AppIcons.voice,
                      ),
                    ],
                  ),
                ),




              ],
            ),

          ),
        );
      }
    );
  }

String subject = 'hello';
String uri = '';
List<String> imageNames = [];
List<String> imagePaths = [];
void _onShare(BuildContext context,String text) async {
  // A builder is used to retrieve the context immediately
  // surrounding the ElevatedButton.
  //
  // The context's `findRenderObject` returns the first
  // RenderObject in its descendent tree when it's not
  // a RenderObjectWidget. The ElevatedButton's RenderObject
  // has its position and size after it's built.
  final box = context.findRenderObject() as RenderBox?;
  final bytes = await controller.capture();

  if (uri.isNotEmpty) {
    await Share.shareUri(Uri.parse(uri));
  } else if (imagePaths.isNotEmpty) {
    final files = <XFile>[];

      // save the bytes as image file
      final file = XFile.fromData(bytes!, name: "Joke");
      files.add(file);
    await Share.shareXFiles(files,
        text: text,
        subject: subject,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  } else {
    await Share.share(text,
        subject: subject,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}


