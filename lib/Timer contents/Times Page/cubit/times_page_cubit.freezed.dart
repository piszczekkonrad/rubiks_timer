// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'times_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimesPageStateTearOff {
  const _$TimesPageStateTearOff();

  _TimesPageState call(
      {required List<TimesModel> times,
      required bool isLoading,
      required String errorMessage}) {
    return _TimesPageState(
      times: times,
      isLoading: isLoading,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $TimesPageState = _$TimesPageStateTearOff();

/// @nodoc
mixin _$TimesPageState {
  List<TimesModel> get times => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimesPageStateCopyWith<TimesPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimesPageStateCopyWith<$Res> {
  factory $TimesPageStateCopyWith(
          TimesPageState value, $Res Function(TimesPageState) then) =
      _$TimesPageStateCopyWithImpl<$Res>;
  $Res call({List<TimesModel> times, bool isLoading, String errorMessage});
}

/// @nodoc
class _$TimesPageStateCopyWithImpl<$Res>
    implements $TimesPageStateCopyWith<$Res> {
  _$TimesPageStateCopyWithImpl(this._value, this._then);

  final TimesPageState _value;
  // ignore: unused_field
  final $Res Function(TimesPageState) _then;

  @override
  $Res call({
    Object? times = freezed,
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      times: times == freezed
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as List<TimesModel>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TimesPageStateCopyWith<$Res>
    implements $TimesPageStateCopyWith<$Res> {
  factory _$TimesPageStateCopyWith(
          _TimesPageState value, $Res Function(_TimesPageState) then) =
      __$TimesPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<TimesModel> times, bool isLoading, String errorMessage});
}

/// @nodoc
class __$TimesPageStateCopyWithImpl<$Res>
    extends _$TimesPageStateCopyWithImpl<$Res>
    implements _$TimesPageStateCopyWith<$Res> {
  __$TimesPageStateCopyWithImpl(
      _TimesPageState _value, $Res Function(_TimesPageState) _then)
      : super(_value, (v) => _then(v as _TimesPageState));

  @override
  _TimesPageState get _value => super._value as _TimesPageState;

  @override
  $Res call({
    Object? times = freezed,
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_TimesPageState(
      times: times == freezed
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as List<TimesModel>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TimesPageState implements _TimesPageState {
  _$_TimesPageState(
      {required this.times,
      required this.isLoading,
      required this.errorMessage});

  @override
  final List<TimesModel> times;
  @override
  final bool isLoading;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'TimesPageState(times: $times, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimesPageState &&
            const DeepCollectionEquality().equals(other.times, times) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(times),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$TimesPageStateCopyWith<_TimesPageState> get copyWith =>
      __$TimesPageStateCopyWithImpl<_TimesPageState>(this, _$identity);
}

abstract class _TimesPageState implements TimesPageState {
  factory _TimesPageState(
      {required List<TimesModel> times,
      required bool isLoading,
      required String errorMessage}) = _$_TimesPageState;

  @override
  List<TimesModel> get times;
  @override
  bool get isLoading;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$TimesPageStateCopyWith<_TimesPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
