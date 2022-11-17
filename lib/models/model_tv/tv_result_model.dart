class TVsModel {
  final List<dynamic> results;

  TVsModel({required this.results});

  factory TVsModel.fromJson(Map<String, dynamic> jsonData) {
    return TVsModel(
      results: jsonData["results"],
    );
  }
}
