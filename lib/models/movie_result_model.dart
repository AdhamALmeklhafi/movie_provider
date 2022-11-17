class MoviesModel {
  final List<dynamic> results;

  MoviesModel({required this.results});

  factory MoviesModel.fromJson(Map<String, dynamic> jsonData) {
    return MoviesModel(
      results: jsonData["results"],
    );
  }
}
