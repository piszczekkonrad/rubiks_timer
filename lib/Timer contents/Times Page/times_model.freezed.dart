// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'times_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimesModelTearOff {
  const _$TimesModelTearOff();

  _TimesModel call({required int time, required String id}) {
    return _TimesModel(
      time: time,
      id: id,
    );
  }
}

/// @nodoc
const $TimesModel = _$TimesModelTearOff();

/// @nodoc
mixin _$TimesModel {
  int get time => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimesModelCopyWith<TimesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimesModelCopyWith<$Res> {
  factory $TimesModelCopyWith(
          TimesModel value, $Res Function(TimesModel) then) =
      _$TimesModelCopyWithImpl<$Res>;
  $Res call({int time, String id});
}

/// @nodoc
class _$TimesModelCopyWithImpl<$Res> implements $TimesModelCopyWith<$Res> {
  _$TimesModelCopyWithImpl(this._value, this._then);

  final TimesModel _value;
  // ignore: unused_field
  final $Res Function(TimesModel) _then;

  @override
  $Res call({
    Object? time = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TimesModelCopyWith<$Res> implements $TimesModelCopyWith<$Res> {
  factory _$TimesModelCopyWith(
          _TimesModel value, $Res Function(_TimesModel) then) =
      __$TimesModelCopyWithImpl<$Res>;
  @override
  $Res call({int time, String id});
}

/// @nodoc
class __$TimesModelCopyWithImpl<$Res> extends _$TimesModelCopyWithImpl<$Res>
    implements _$TimesModelCopyWith<$Res> {
  __$TimesModelCopyWithImpl(
      _TimesModel _value, $Res Function(_TimesModel) _then)
      : super(_value, (v) => _then(v as _TimesModel));

  @override
  _TimesModel get _value => super._value as _TimesModel;

  @override
  $Res call({
    Object? time = freezed,
    Object? id = freezed,
  }) {
    return _then(_TimesModel(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TimesModel implements _TimesModel {
  _$_TimesModel({required this.time, required this.id});

  @override
  final int time;
  @override
  final String id;

  @override
  String toString() {
    return 'TimesModel(time: $time, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimesModel &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$TimesModelCopyWith<_TimesModel> get copyWith =>
      __$TimesModelCopyWithImpl<_TimesModel>(this, _$identity);
}

abstract class _TimesModel implements TimesModel {
  factory _TimesModel({required int time, required String id}) = _$_TimesModel;

  @override
  int get time;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$TimesModelCopyWith<_TimesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
