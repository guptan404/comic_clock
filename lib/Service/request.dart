import 'dart:convert';

import '../Model/JokeModel.dart';
import 'package:http/http.dart' as http;

const BASE_URL = 'https://geek-jokes.sameerkumar.website/api?format=json';

class JokeService {
  Future<JokeModel> getJoke() async {
    try {
      var response = await http.get(Uri.parse(BASE_URL));
      if (response.statusCode == 200) {
        return JokeModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load joke');
      }
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}