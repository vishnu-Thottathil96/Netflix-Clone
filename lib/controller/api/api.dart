import 'dart:convert';

import 'package:netflix/models/model_movie.dart';
import 'package:http/http.dart' as http;
import '../../core/constant/api_key.dart';

class Api {
  static const _topSearchesUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Keys.apiKey}";
  static const _nowPlayingUrl =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=${Keys.apiKey}";
  static const _popularUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Keys.apiKey}";
  static const _upcomingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Keys.apiKey}";
  static const _top10InIndiaToday =
      "https://api.themoviedb.org/3/discover/tv?api_key=${Keys.apiKey}&with_original_language=hi&sort_by=popularity.desc";
  static const _searchMovie =
      "https://api.themoviedb.org/3/search/movie?api_key=${Keys.apiKey}&query=";

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

  Future<List<MovieModel>> top10InIndiaToday() async {
    final response = await http.get(Uri.parse(_top10InIndiaToday));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final upcomingList = decodedData['results'] as List;
      return upcomingList.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  Future<List<MovieModel>> getSearchApi({required String searchKeyWord}) async {
    final response = await http.get(Uri.parse(_searchMovie + searchKeyWord));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final searchedList = decodedData['results'] as List;
      return searchedList.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  static const fastLaugh =
      "https://run.mocky.io/v3/e5b9ed99-e74a-4a1f-a624-aad618c77a85";

  Future<List<String>> getFastLaughVideoUrls() async {
    final response = await http.get(Uri.parse(fastLaugh));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["videoUrls"] as List;

      return responseData.map((videoUrl) => videoUrl as String).toList();
    } else {
      throw Exception('something went wrong');
    }
  }
}
