part of 'timer_cubit.dart';

@immutable
class TimerState {
  final String time;
  final bool running;
  final bool reseting;
  final bool saved;
  final String errorMessage;

  const TimerState({
    required this.time,
    required this.running,
    required this.reseting,
    required this.saved,
    required this.errorMessage,
  });
}
