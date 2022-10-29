import 'package:freezed_annotation/freezed_annotation.dart';
part 'solving_model.g.dart';
part 'solving_model.freezed.dart';

@freezed
class SolvingModel with _$SolvingModel {
  factory SolvingModel(
    int id,
    String alghorithm,
    String picture,
  ) = _SolvingModel;

  factory SolvingModel.fromJson(Map<String, dynamic> json) =>
      _$SolvingModelFromJson(json);
}

// @JsonSerializable()
// class SolvingModel {
//   SolvingModel({
//     required this.id,
//     required this.alghorithm,
//     required this.picture,
//   });
//   final int id;
//   final String alghorithm;
//   final String picture;

//   factory SolvingModel.fromJson(Map<String, dynamic> json) =>
//       _$SolvingModelFromJson(json);

//   Map<String, dynamic> toJson() => _$SolvingModelToJson(this);
// }
