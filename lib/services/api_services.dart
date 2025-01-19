import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke.dart'; 

class ApiServices {
  static const String baseUrl = "https://official-joke-api.appspot.com";

  static Future<List<String>> getJokeTypes() async {
    final response = await http.get(Uri.parse("$baseUrl/types"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return List<String>.from(data);
    } else {
      throw Exception("Failed to load joke types!");
    }
  }

  static Future<List<Joke>> getJokesByType(String type) async {
    final response = await http.get(Uri.parse("$baseUrl/jokes/$type/ten"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return List<Joke>.from(data.map((item) => Joke.fromJson(item)));
    } else {
      throw Exception("Failed to load jokes by type!");
    }
  }

  static Future<Joke> getRandomJoke() async {
    final response = await http.get(Uri.parse("$baseUrl/random_joke"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return Joke.fromJson(data);
    } else {
      throw Exception("Failed to load random joke!");
    }
  }
}
