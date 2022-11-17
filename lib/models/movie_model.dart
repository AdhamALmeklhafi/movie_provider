// ignore_for_file: non_constant_identifier_names

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String release_date;
  final String backdrop_path;
  final String poster_path;
  final String media_type;
  final double vote_average;
  final double original_name;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.release_date,
    required this.backdrop_path,
    required this.poster_path,
    required this.media_type,
    required this.vote_average,
    required this.original_name,
  });

  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
      id: jsonData["id"],
      title: jsonData["title"],
      overview: jsonData["overview"],
      release_date: jsonData["release_date"],
      backdrop_path: jsonData["backdrop_path"],
      poster_path: jsonData["poster_path"],
      media_type: jsonData["media_type"],
      vote_average: jsonData["vote_average"],
      original_name: jsonData["original_name"],
    );
  }
}
