// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimerStateTearOff {
  const _$TimerStateTearOff();

  _TimerState call(
      {required String time,
      required String errorMessage,
      required TimerStatus timerStatus}) {
    return _TimerState(
      time: time,
      errorMessage: errorMessage,
      timerStatus: timerStatus,
    );
  }
}

/// @nodoc
const $TimerState = _$TimerStateTearOff();

/// @nodoc
mixin _$TimerState {
  String get time => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  TimerStatus get timerStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res>;
  $Res call({String time, String errorMessage, TimerStatus timerStatus});
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res> implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  final TimerState _value;
  // ignore: unused_field
  final $Res Function(TimerState) _then;

  @override
  $Res call({
    Object? time = freezed,
    Object? errorMessage = freezed,
    Object? timerStatus = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timerStatus: timerStatus == freezed
          ? _value.timerStatus
          : timerStatus // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
    ));
  }
}

/// @nodoc
abstract class _$TimerStateCopyWith<$Res> implements $TimerStateCopyWith<$Res> {
  factory _$TimerStateCopyWith(
          _TimerState value, $Res Function(_TimerState) then) =
      __$TimerStateCopyWithImpl<$Res>;
  @override
  $Res call({String time, String errorMessage, TimerStatus timerStatus});
}

/// @nodoc
class __$TimerStateCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements _$TimerStateCopyWith<$Res> {
  __$TimerStateCopyWithImpl(
      _TimerState _value, $Res Function(_TimerState) _then)
      : super(_value, (v) => _then(v as _TimerState));

  @override
  _TimerState get _value => super._value as _TimerState;

  @override
  $Res call({
    Object? time = freezed,
    Object? errorMessage = freezed,
    Object? timerStatus = freezed,
  }) {
    return _then(_TimerState(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timerStatus: timerStatus == freezed
          ? _value.timerStatus
          : timerStatus // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
    ));
  }
}

/// @nodoc

class _$_TimerState implements _TimerState {
  _$_TimerState(
      {required this.time,
      required this.errorMessage,
      required this.timerStatus});

  @override
  final String time;
  @override
  final String errorMessage;
  @override
  final TimerStatus timerStatus;

  @override
  String toString() {
    return 'TimerState(time: $time, errorMessage: $errorMessage, timerStatus: $timerStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimerState &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage) &&
            const DeepCollectionEquality()
                .equals(other.timerStatus, timerStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(errorMessage),
      const DeepCollectionEquality().hash(timerStatus));

  @JsonKey(ignore: true)
  @override
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      __$TimerStateCopyWithImpl<_TimerState>(this, _$identity);
}

abstract class _TimerState implements TimerState {
  factory _TimerState(
      {required String time,
      required String errorMessage,
      required TimerStatus timerStatus}) = _$_TimerState;

  @override
  String get time;
  @override
  String get errorMessage;
  @override
  TimerStatus get timerStatus;
  @override
  @JsonKey(ignore: true)
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}
