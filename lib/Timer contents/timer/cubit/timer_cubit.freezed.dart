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
      required bool running,
      required bool reseting,
      required bool saved,
      required String errorMessage}) {
    return _TimerState(
      time: time,
      running: running,
      reseting: reseting,
      saved: saved,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $TimerState = _$TimerStateTearOff();

/// @nodoc
mixin _$TimerState {
  String get time => throw _privateConstructorUsedError;
  bool get running => throw _privateConstructorUsedError;
  bool get reseting => throw _privateConstructorUsedError;
  bool get saved => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res>;
  $Res call(
      {String time,
      bool running,
      bool reseting,
      bool saved,
      String errorMessage});
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
    Object? running = freezed,
    Object? reseting = freezed,
    Object? saved = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      running: running == freezed
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as bool,
      reseting: reseting == freezed
          ? _value.reseting
          : reseting // ignore: cast_nullable_to_non_nullable
              as bool,
      saved: saved == freezed
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TimerStateCopyWith<$Res> implements $TimerStateCopyWith<$Res> {
  factory _$TimerStateCopyWith(
          _TimerState value, $Res Function(_TimerState) then) =
      __$TimerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String time,
      bool running,
      bool reseting,
      bool saved,
      String errorMessage});
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
    Object? running = freezed,
    Object? reseting = freezed,
    Object? saved = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_TimerState(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      running: running == freezed
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as bool,
      reseting: reseting == freezed
          ? _value.reseting
          : reseting // ignore: cast_nullable_to_non_nullable
              as bool,
      saved: saved == freezed
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TimerState implements _TimerState {
  _$_TimerState(
      {required this.time,
      required this.running,
      required this.reseting,
      required this.saved,
      required this.errorMessage});

  @override
  final String time;
  @override
  final bool running;
  @override
  final bool reseting;
  @override
  final bool saved;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'TimerState(time: $time, running: $running, reseting: $reseting, saved: $saved, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimerState &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.running, running) &&
            const DeepCollectionEquality().equals(other.reseting, reseting) &&
            const DeepCollectionEquality().equals(other.saved, saved) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(running),
      const DeepCollectionEquality().hash(reseting),
      const DeepCollectionEquality().hash(saved),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      __$TimerStateCopyWithImpl<_TimerState>(this, _$identity);
}

abstract class _TimerState implements TimerState {
  factory _TimerState(
      {required String time,
      required bool running,
      required bool reseting,
      required bool saved,
      required String errorMessage}) = _$_TimerState;

  @override
  String get time;
  @override
  bool get running;
  @override
  bool get reseting;
  @override
  bool get saved;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}
