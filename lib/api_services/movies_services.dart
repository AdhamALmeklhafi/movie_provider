import 'dart:convert';

import 'package:movie_apps/models/model_person/person_model.dart';
import 'package:movie_apps/models/model_tv/tv_model.dart';
import 'package:movie_apps/models/model_tv/tv_result_model.dart';
import 'package:movie_apps/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_apps/models/movie_result_model.dart';

class MoviesApi {
  Future<List<MovieModel>> fetchTrendingMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/movie/week?api_key=bfdb9b4e1e15f06e21b84d07130c1e91&a&page=5'));
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      MoviesModel results = MoviesModel.fromJson(jsonData);
      List<MovieModel> resultsList =
          results.results.map((e) => MovieModel.fromJson(e)).toList();
      return resultsList;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<TvModel>> fetchTrendingTv() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/tv/week?api_key=bfdb9b4e1e15f06e21b84d07130c1e91&adult=false'));
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      TVsModel results = TVsModel.fromJson(jsonData);
      List<TvModel> resultsList =
          results.results.map((e) => TvModel.fromJson(e)).toList();
      return resultsList;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<PersonModel>> fetchTrendingPerson() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/person/week?api_key=bfdb9b4e1e15f06e21b84d07130c1e91&page=5'));
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      TVsModel results = TVsModel.fromJson(jsonData);
      List<PersonModel> resultsList =
          results.results.map((e) => PersonModel.fromJson(e)).toList();
      return resultsList;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
