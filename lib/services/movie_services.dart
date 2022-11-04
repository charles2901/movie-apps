import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/model/detail_movie.dart';
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

  static Future<List<Movie>?> getPopular(
      {language = 'en-US', page = '1', region = ''}) async {
    var response = await http.get(
      Uri.parse(
          '$kBaseUrl/movie/popular?api_key=$apiKey&language=en-US&page=$page&region=$region'),
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

  static Future<List<Movie>?> getTopRated(
      {language = 'en-US', page = '1', region = ''}) async {
    var response = await http.get(
      Uri.parse(
          '$kBaseUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=$page&region=$region'),
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

  static Future<List<Movie>?> getUpcoming(
      {language = 'en-US', page = '1'}) async {
    var response = await http.get(
      Uri.parse(
          '$kBaseUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=$page'),
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

  static Future<List<Movie>?> getSimiliarMovies(int id,
      {language = 'en-US'}) async {
    logPrint('$kBaseUrl/movie/$id/similar?api_key=$apiKey&language=en-US');
    var response = await http.get(
      Uri.parse('$kBaseUrl/movie/$id/similar?api_key=$apiKey&language=en-US'),
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

  static Future<DetailMovie?> getDetails(int id, {language = 'en-US'}) async {
    var response = await http.get(
      Uri.parse('$kBaseUrl/movie/$id?api_key=$apiKey&language=en-US'),
    );

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return DetailMovie.fromJson(body);
    }
    return null;
  }
}
