import 'dart:convert';

import '../Model/JokeModel.dart';
import 'package:http/http.dart' as http;

const BASE_URL = 'https://geek-jokes.sameerkumar.website/api?format=json';

class JokeService {
  Future<JokeModel> getJoke() async {
    var request = http.Request('GET', Uri.parse('https://geek-jokes.sameerkumar.website/api?format=json'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body=await response.stream.bytesToString();
      print("body:$body");
      return JokeModel.fromJson(json.decode(body));
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load joke');
    }
  }
}