import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/utils/global_k.dart';

class MovieServices {
  static var client = http.Client();

  static Future<List<Movie>?> getNowPlaying(
      {language = 'en-US', page = '1'}) async {
    var response = await http.get(
      Uri.parse(
          '$kBaseUrl/movie/now_playing?api_key=$apiKey&language=en-US&page=$page'),
    );

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var results = body['results'] as List;
      return List.generate(
        results.length,
        (index) => Movie.fromJson(results[index]),
      );
    }
    return null;
  }
}
