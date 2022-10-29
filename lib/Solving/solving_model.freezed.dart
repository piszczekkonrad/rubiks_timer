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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolvingModel _$SolvingModelFromJson(Map<String, dynamic> json) {
  return _SolvingModel.fromJson(json);
}

/// @nodoc
class _$SolvingModelTearOff {
  const _$SolvingModelTearOff();

  _SolvingModel call(int id, String alghorithm, String picture) {
    return _SolvingModel(
      id,
      alghorithm,
      picture,
    );
  }

  SolvingModel fromJson(Map<String, Object?> json) {
    return SolvingModel.fromJson(json);
  }
}

/// @nodoc
const $SolvingModel = _$SolvingModelTearOff();

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
      _$SolvingModelCopyWithImpl<$Res>;
  $Res call({int id, String alghorithm, String picture});
}

/// @nodoc
class _$SolvingModelCopyWithImpl<$Res> implements $SolvingModelCopyWith<$Res> {
  _$SolvingModelCopyWithImpl(this._value, this._then);

  final SolvingModel _value;
  // ignore: unused_field
  final $Res Function(SolvingModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? alghorithm = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      alghorithm: alghorithm == freezed
          ? _value.alghorithm
          : alghorithm // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SolvingModelCopyWith<$Res>
    implements $SolvingModelCopyWith<$Res> {
  factory _$SolvingModelCopyWith(
          _SolvingModel value, $Res Function(_SolvingModel) then) =
      __$SolvingModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String alghorithm, String picture});
}

/// @nodoc
class __$SolvingModelCopyWithImpl<$Res> extends _$SolvingModelCopyWithImpl<$Res>
    implements _$SolvingModelCopyWith<$Res> {
  __$SolvingModelCopyWithImpl(
      _SolvingModel _value, $Res Function(_SolvingModel) _then)
      : super(_value, (v) => _then(v as _SolvingModel));

  @override
  _SolvingModel get _value => super._value as _SolvingModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? alghorithm = freezed,
    Object? picture = freezed,
  }) {
    return _then(_SolvingModel(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      alghorithm == freezed
          ? _value.alghorithm
          : alghorithm // ignore: cast_nullable_to_non_nullable
              as String,
      picture == freezed
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
            other is _SolvingModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.alghorithm, alghorithm) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(alghorithm),
      const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  _$SolvingModelCopyWith<_SolvingModel> get copyWith =>
      __$SolvingModelCopyWithImpl<_SolvingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SolvingModelToJson(this);
  }
}

abstract class _SolvingModel implements SolvingModel {
  factory _SolvingModel(int id, String alghorithm, String picture) =
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
  _$SolvingModelCopyWith<_SolvingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
