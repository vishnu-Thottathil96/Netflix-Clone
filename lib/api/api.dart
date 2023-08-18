import 'dart:convert';

import 'package:netflix/models/model_movie.dart';
import 'package:http/http.dart' as http;
import '../core/constant/api_key.dart';

class Api {
  static const _topSearchesUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Keys.apiKey}";
  static const _nowPlayingUrl =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=${Keys.apiKey}";
  static const _popularUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Keys.apiKey}";
  static const _upcomingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Keys.apiKey}";

  Future<List<MovieModel>> getTopMovies() async {
    final response = await http.get(Uri.parse(_topSearchesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final topSearchList = decodedData['results'] as List;
      return topSearchList.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load top movies');
    }
  }

  Future<List<MovieModel>> getNowPlaying() async {
    final response = await http.get(Uri.parse(_nowPlayingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final nowPlayingList = decodedData['results'] as List;
      return nowPlayingList.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  Future<List<MovieModel>> getPopular() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final popularList = decodedData['results'] as List;
      return popularList.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieModel>> getUpcoming() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final upcomingList = decodedData['results'] as List;
      return upcomingList.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
