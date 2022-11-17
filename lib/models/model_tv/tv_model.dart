// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'dart:convert';

class TvModel {
  final int id;
  final String name;
  final String overview;
  final String release_date;
  final String poster_path;
  final String backdrop_path;
  final double vote_average;
  final String media_type;

  TvModel({
    required this.id,
    required this.name,
    required this.overview,
    required this.release_date,
    required this.poster_path,
    required this.backdrop_path,
    required this.vote_average,
    required this.media_type,
  });

  factory TvModel.fromJson(Map<String, dynamic> jsonData) {
    return TvModel(
      id: jsonData["id"],
      name: jsonData["name"],
      overview: jsonData["overview"],
      release_date: jsonData["release_date"],
      poster_path: jsonData["poster_path"],
      backdrop_path: jsonData["backdrop_path"],
      vote_average: jsonData["vote_average"],
      media_type: jsonData["media_type"],
    );
  }
}
