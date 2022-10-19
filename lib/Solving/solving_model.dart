class SolvingModel {
  SolvingModel({
    required this.id,
    required this.alghorithm,
    required this.picture,
  });
  final int id;
  final String alghorithm;
  final String picture;

  SolvingModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        alghorithm = json["alghorithm"],
        picture = json["picture"];
}
