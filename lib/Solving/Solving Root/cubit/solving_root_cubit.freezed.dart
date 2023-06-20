// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'solving_root_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SolvingRootStateTearOff {
  const _$SolvingRootStateTearOff();

  _SolvingRootState call(
      {List<SolvingModel> results = const [],
      Status status = Status.loading,
      String? errorMessage}) {
    return _SolvingRootState(
      results: results,
      status: status,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $SolvingRootState = _$SolvingRootStateTearOff();

/// @nodoc
mixin _$SolvingRootState {
  List<SolvingModel> get results => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SolvingRootStateCopyWith<SolvingRootState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolvingRootStateCopyWith<$Res> {
  factory $SolvingRootStateCopyWith(
          SolvingRootState value, $Res Function(SolvingRootState) then) =
      _$SolvingRootStateCopyWithImpl<$Res>;
  $Res call({List<SolvingModel> results, Status status, String? errorMessage});
}

/// @nodoc
class _$SolvingRootStateCopyWithImpl<$Res>
    implements $SolvingRootStateCopyWith<$Res> {
  _$SolvingRootStateCopyWithImpl(this._value, this._then);

  final SolvingRootState _value;
  // ignore: unused_field
  final $Res Function(SolvingRootState) _then;

  @override
  $Res call({
    Object? results = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SolvingModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SolvingRootStateCopyWith<$Res>
    implements $SolvingRootStateCopyWith<$Res> {
  factory _$SolvingRootStateCopyWith(
          _SolvingRootState value, $Res Function(_SolvingRootState) then) =
      __$SolvingRootStateCopyWithImpl<$Res>;
  @override
  $Res call({List<SolvingModel> results, Status status, String? errorMessage});
}

/// @nodoc
class __$SolvingRootStateCopyWithImpl<$Res>
    extends _$SolvingRootStateCopyWithImpl<$Res>
    implements _$SolvingRootStateCopyWith<$Res> {
  __$SolvingRootStateCopyWithImpl(
      _SolvingRootState _value, $Res Function(_SolvingRootState) _then)
      : super(_value, (v) => _then(v as _SolvingRootState));

  @override
  _SolvingRootState get _value => super._value as _SolvingRootState;

  @override
  $Res call({
    Object? results = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_SolvingRootState(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SolvingModel>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SolvingRootState implements _SolvingRootState {
  _$_SolvingRootState(
      {this.results = const [],
      this.status = Status.loading,
      this.errorMessage});

  @JsonKey()
  @override
  final List<SolvingModel> results;
  @JsonKey()
  @override
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SolvingRootState(results: $results, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SolvingRootState &&
            const DeepCollectionEquality().equals(other.results, results) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(results),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$SolvingRootStateCopyWith<_SolvingRootState> get copyWith =>
      __$SolvingRootStateCopyWithImpl<_SolvingRootState>(this, _$identity);
}

abstract class _SolvingRootState implements SolvingRootState {
  factory _SolvingRootState(
      {List<SolvingModel> results,
      Status status,
      String? errorMessage}) = _$_SolvingRootState;

  @override
  List<SolvingModel> get results;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$SolvingRootStateCopyWith<_SolvingRootState> get copyWith =>
      throw _privateConstructorUsedError;
}
