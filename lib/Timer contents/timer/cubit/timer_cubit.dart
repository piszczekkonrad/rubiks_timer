import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../timer_repository.dart';
part 'timer_state.dart';

@injectable
class TimerCubit extends Cubit<TimerState> {
  TimerCubit({required this.timerRepository})
      : super(
          const TimerState(
            time: '',
            running: false,
            reseting: false,
            saved: false,
            errorMessage: '',
          ),
        );

  final TimerRepository timerRepository;
  final stopwatch = Stopwatch();
  late Timer _timer;
  Future<void> start() async {
    emit(
      TimerState(
        time: timerRepository.getTime(),
        running: false,
        reseting: false,
        saved: false,
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
            time: timerRepository.getTime(),
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
    timerRepository.stop();
    emit(
      TimerState(
        time: timerRepository.getTime(),
        running: false,
        reseting: true,
        saved: false,
        errorMessage: '',
      ),
    );
  }

  Future<void> timeReset() async {
    timerRepository.reset();
    emit(
      TimerState(
        time: timerRepository.getTime(),
        running: false,
        reseting: false,
        saved: false,
        errorMessage: '',
      ),
    );
  }

  Future<void> addTime() async {
    timerRepository.addTime();
    emit(
      TimerState(
        time: timerRepository.getTime(),
        running: false,
        reseting: false,
        saved: true,
        errorMessage: '',
      ),
    );
  }
}
