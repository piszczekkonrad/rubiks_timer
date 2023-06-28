import 'package:freezed_annotation/freezed_annotation.dart';

part 'times_model.freezed.dart';

@freezed
class TimesModel with _$TimesModel {
  factory TimesModel({
    required String time,
    required String id,
  }) = _TimesModel;
}
