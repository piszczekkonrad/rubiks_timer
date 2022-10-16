import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../timer_repository.dart';
part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit(this._timerRepository)
      : super(
          const TimerState(
            time: '',
            running: false,
            reseting: false,
            saved: false,
            errorMessage: '',
          ),
        );

  final TimerRepository _timerRepository;
  final stopwatch = Stopwatch();
  late Timer _timer;
  Future<void> start() async {
    emit(
      TimerState(
        time: _timerRepository.getTime(),
        running: false,
        reseting: false,
        saved: false,
        errorMessage: '',
      ),
    );
  }

  Future<void> timeStart() async {
    _timerRepository.start();
    _timer = Timer.periodic(
      const Duration(milliseconds: 30),
      (timer) {
        emit(
          TimerState(
            time: _timerRepository.getTime(),
            running: true,
            reseting: false,
            saved: false,
            errorMessage: '',
          ),
        );
      },
    );
  }

  Future<void> timeStop() async {
    _timer.cancel();
    _timerRepository.stop();
    emit(
      TimerState(
        time: _timerRepository.getTime(),
        running: false,
        reseting: true,
        saved: false,
        errorMessage: '',
      ),
    );
  }

  Future<void> timeReset() async {
    _timerRepository.reset();
    emit(
      TimerState(
        time: _timerRepository.getTime(),
        running: false,
        reseting: false,
        saved: false,
        errorMessage: '',
      ),
    );
  }

  Future<void> addTime() async {
    _timerRepository.addTime();
    emit(
      TimerState(
        time: _timerRepository.getTime(),
        running: false,
        reseting: false,
        saved: true,
        errorMessage: '',
      ),
    );
  }
}
