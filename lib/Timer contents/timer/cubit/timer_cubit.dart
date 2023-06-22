import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/enums.dart';
import '../timer_repository.dart';
part 'timer_state.dart';

part 'timer_cubit.freezed.dart';

@injectable
class TimerCubit extends Cubit<TimerState> {
  TimerCubit({required this.timerRepository})
      : super(
          TimerState(
            timerStatus: TimerStatus.stopped,
            time: '',
            errorMessage: '',
          ),
        );

  final TimerRepository timerRepository;
  final stopwatch = Stopwatch();
  late Timer _timer;
  Future<void> start() async {
    emit(
      TimerState(
        timerStatus: TimerStatus.stopped,
        time: timerRepository.getTime(),
        errorMessage: '',
      ),
    );
  }

  Future<void> timeStart() async {
    timerRepository.start();
    _timer = Timer.periodic(
      const Duration(milliseconds: 30),
      (timer) {
        emit(
          TimerState(
            timerStatus: TimerStatus.running,
            time: timerRepository.getTime(),
            errorMessage: '',
          ),
        );
      },
    );
  }

  Future<void> timeStop() async {
    _timer.cancel();
    timerRepository.stop();
    emit(
      TimerState(
        timerStatus: TimerStatus.reseting,
        time: timerRepository.getTime(),
        errorMessage: '',
      ),
    );
  }

  Future<void> timeReset() async {
    timerRepository.reset();
    emit(
      TimerState(
        timerStatus: TimerStatus.stopped,
        time: timerRepository.getTime(),
        errorMessage: '',
      ),
    );
  }

  Future<void> addTime() async {
    await timerRepository.addTime();
    emit(
      TimerState(
        timerStatus: TimerStatus.saved,
        time: timerRepository.getTime(),
        errorMessage: '',
      ),
    );
  }
}
