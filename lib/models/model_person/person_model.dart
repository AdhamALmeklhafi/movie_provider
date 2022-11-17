import 'package:flutter/foundation.dart';
import 'dart:convert';

class PersonModel {
  final int id;
  final String name;
  final String overview;
  final String release_date;
  final String profile_path;
  final double vote_average;
  final double popularity;

  PersonModel({
    required this.id,
    required this.name,
    required this.overview,
    required this.release_date,
    required this.profile_path,
    required this.vote_average,
    required this.popularity,
  });

  factory PersonModel.fromJson(Map<String, dynamic> jsonData) {
    return PersonModel(
      id: jsonData["id"],
      name: jsonData["name"],
      overview: jsonData["overview"],
      release_date: jsonData["release_date"],
      profile_path: jsonData["profile_path"],
      vote_average: jsonData["vote_average"],
      popularity: jsonData["popularity"],
    );
  }
}
