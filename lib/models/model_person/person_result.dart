class PersonModel {
  final List<dynamic> results;

  PersonModel({required this.results});

  factory PersonModel.fromJson(Map<String, dynamic> jsonData) {
    return PersonModel(
      results: jsonData["results"],
    );
  }
}
