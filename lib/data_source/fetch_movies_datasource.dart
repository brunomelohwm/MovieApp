import 'dart:convert';

import 'package:movies_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class FetchMoviesDataSource {
  final String apikey = '1f0eff93de7c467191931ae3861e556b';
  static const _baseUrl = "https://api.themoviedb.org/3";
  static const _key = "?api_key=1f0eff93de7c467191931ae3861e556b";

  static const fetchPopular = "$_baseUrl/movie/popular$_key";

  static const fetchFreeToWatch = "$_baseUrl/movie/now_playing$_key";
  static Future<List<MovieModel>> getMoviesFreeToWatch() async {
    try {
      final client = http.Client();
      final result = await client.get(
        Uri.parse(fetchFreeToWatch),
      );
      final responseJson = json.decode(result.body)['results'] as List;
      return responseJson.map((e) => MovieModel.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<MovieModel>> getMoviesPopular() async {
    try {
      final client = http.Client();
      final result = await client.get(
        Uri.parse(fetchPopular),
      );
      final responseJson = json.decode(result.body)['results'] as List;
      return responseJson.map((e) => MovieModel.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
