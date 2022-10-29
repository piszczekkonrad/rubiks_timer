part of 'timer_root_cubit.dart';

@immutable
class TimerRootState {
  const TimerRootState({
    required this.user,
    required this.index,
    required this.isLoading,
  });
  final int index;
  final User? user;
  final bool isLoading;
}
