// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timer_root_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimerRootStateTearOff {
  const _$TimerRootStateTearOff();

  _TimerRootState call(
      {required int index, required User? user, required bool isLoading}) {
    return _TimerRootState(
      index: index,
      user: user,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $TimerRootState = _$TimerRootStateTearOff();

/// @nodoc
mixin _$TimerRootState {
  int get index => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerRootStateCopyWith<TimerRootState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerRootStateCopyWith<$Res> {
  factory $TimerRootStateCopyWith(
          TimerRootState value, $Res Function(TimerRootState) then) =
      _$TimerRootStateCopyWithImpl<$Res>;
  $Res call({int index, User? user, bool isLoading});
}

/// @nodoc
class _$TimerRootStateCopyWithImpl<$Res>
    implements $TimerRootStateCopyWith<$Res> {
  _$TimerRootStateCopyWithImpl(this._value, this._then);

  final TimerRootState _value;
  // ignore: unused_field
  final $Res Function(TimerRootState) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? user = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TimerRootStateCopyWith<$Res>
    implements $TimerRootStateCopyWith<$Res> {
  factory _$TimerRootStateCopyWith(
          _TimerRootState value, $Res Function(_TimerRootState) then) =
      __$TimerRootStateCopyWithImpl<$Res>;
  @override
  $Res call({int index, User? user, bool isLoading});
}

/// @nodoc
class __$TimerRootStateCopyWithImpl<$Res>
    extends _$TimerRootStateCopyWithImpl<$Res>
    implements _$TimerRootStateCopyWith<$Res> {
  __$TimerRootStateCopyWithImpl(
      _TimerRootState _value, $Res Function(_TimerRootState) _then)
      : super(_value, (v) => _then(v as _TimerRootState));

  @override
  _TimerRootState get _value => super._value as _TimerRootState;

  @override
  $Res call({
    Object? index = freezed,
    Object? user = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_TimerRootState(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TimerRootState implements _TimerRootState {
  _$_TimerRootState(
      {required this.index, required this.user, required this.isLoading});

  @override
  final int index;
  @override
  final User? user;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'TimerRootState(index: $index, user: $user, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimerRootState &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$TimerRootStateCopyWith<_TimerRootState> get copyWith =>
      __$TimerRootStateCopyWithImpl<_TimerRootState>(this, _$identity);
}

abstract class _TimerRootState implements TimerRootState {
  factory _TimerRootState(
      {required int index,
      required User? user,
      required bool isLoading}) = _$_TimerRootState;

  @override
  int get index;
  @override
  User? get user;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$TimerRootStateCopyWith<_TimerRootState> get copyWith =>
      throw _privateConstructorUsedError;
}
