// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'solving_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolvingModel _$SolvingModelFromJson(Map<String, dynamic> json) {
  return _SolvingModel.fromJson(json);
}

/// @nodoc
mixin _$SolvingModel {
  int get id => throw _privateConstructorUsedError;
  String get alghorithm => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolvingModelCopyWith<SolvingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolvingModelCopyWith<$Res> {
  factory $SolvingModelCopyWith(
          SolvingModel value, $Res Function(SolvingModel) then) =
      _$SolvingModelCopyWithImpl<$Res, SolvingModel>;
  @useResult
  $Res call({int id, String alghorithm, String picture});
}

/// @nodoc
class _$SolvingModelCopyWithImpl<$Res, $Val extends SolvingModel>
    implements $SolvingModelCopyWith<$Res> {
  _$SolvingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? alghorithm = null,
    Object? picture = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      alghorithm: null == alghorithm
          ? _value.alghorithm
          : alghorithm // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SolvingModelCopyWith<$Res>
    implements $SolvingModelCopyWith<$Res> {
  factory _$$_SolvingModelCopyWith(
          _$_SolvingModel value, $Res Function(_$_SolvingModel) then) =
      __$$_SolvingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String alghorithm, String picture});
}

/// @nodoc
class __$$_SolvingModelCopyWithImpl<$Res>
    extends _$SolvingModelCopyWithImpl<$Res, _$_SolvingModel>
    implements _$$_SolvingModelCopyWith<$Res> {
  __$$_SolvingModelCopyWithImpl(
      _$_SolvingModel _value, $Res Function(_$_SolvingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? alghorithm = null,
    Object? picture = null,
  }) {
    return _then(_$_SolvingModel(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == alghorithm
          ? _value.alghorithm
          : alghorithm // ignore: cast_nullable_to_non_nullable
              as String,
      null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SolvingModel implements _SolvingModel {
  _$_SolvingModel(this.id, this.alghorithm, this.picture);

  factory _$_SolvingModel.fromJson(Map<String, dynamic> json) =>
      _$$_SolvingModelFromJson(json);

  @override
  final int id;
  @override
  final String alghorithm;
  @override
  final String picture;

  @override
  String toString() {
    return 'SolvingModel(id: $id, alghorithm: $alghorithm, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SolvingModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.alghorithm, alghorithm) ||
                other.alghorithm == alghorithm) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, alghorithm, picture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SolvingModelCopyWith<_$_SolvingModel> get copyWith =>
      __$$_SolvingModelCopyWithImpl<_$_SolvingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SolvingModelToJson(
      this,
    );
  }
}

abstract class _SolvingModel implements SolvingModel {
  factory _SolvingModel(
          final int id, final String alghorithm, final String picture) =
      _$_SolvingModel;

  factory _SolvingModel.fromJson(Map<String, dynamic> json) =
      _$_SolvingModel.fromJson;

  @override
  int get id;
  @override
  String get alghorithm;
  @override
  String get picture;
  @override
  @JsonKey(ignore: true)
  _$$_SolvingModelCopyWith<_$_SolvingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
