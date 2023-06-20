part of 'timer_root_cubit.dart';

@freezed
class TimerRootState with _$TimerRootState {
  factory TimerRootState({
    required int index,
    required User? user,
    required bool isLoading,
  }) = _TimerRootState;
}
