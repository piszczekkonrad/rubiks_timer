part of 'timer_cubit.dart';

@freezed
class TimerState with _$TimerState {
  factory TimerState({
    required String time,
    required String errorMessage,
    required TimerStatus timerStatus,
  }) = _TimerState;
}
