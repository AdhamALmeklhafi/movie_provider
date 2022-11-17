import 'package:flutter/cupertino.dart';
import 'package:movie_apps/api_services/movies_services.dart';
import 'package:movie_apps/models/model_person/person_model.dart';
import 'package:movie_apps/models/model_tv/tv_model.dart';
import 'package:movie_apps/models/movie_model.dart';

class MovieList extends ChangeNotifier {
  List<MovieModel> _movieList = [];
  List<TvModel> _tvList = [];
  List<PersonModel> _personList = [];
  bool isLoading = true;

  Future<void> fetchMovie() async {
    isLoading = true;
    _movieList = await MoviesApi().fetchTrendingMovies();
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchTv() async {
    isLoading = true;
    _tvList = await MoviesApi().fetchTrendingTv();
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPerson() async {
    isLoading = true;
    _personList = await MoviesApi().fetchTrendingPerson();
    isLoading = false;
    notifyListeners();
  }

  List<MovieModel> get movieList => _movieList;
  List<TvModel> get tvList => _tvList;
  List<PersonModel> get personList => _personList;
}
