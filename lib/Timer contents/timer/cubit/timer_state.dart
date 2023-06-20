part of 'timer_cubit.dart';

@freezed
class TimerState with _$TimerState {
  factory TimerState({
    required String time,
    required bool running,
    required bool reseting,
    required bool saved,
    required String errorMessage,
  }) = _TimerState;
}
