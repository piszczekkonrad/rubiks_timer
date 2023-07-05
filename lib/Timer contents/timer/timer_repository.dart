import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/Timer%20contents/timer/timer_remote_data_source.dart';

@injectable
class TimerRepository {
  TimerRepository(this._timerRemoteDataSource);

  final TimerRemoteDataSource _timerRemoteDataSource;
  final stopwatch = Stopwatch();
  Future<void> start() async {
    stopwatch.start();
  }

  Future<void> stop() async {
    stopwatch.stop();
  }

  Future<void> reset() async {
    stopwatch.reset();
  }

  Future<void> addTime() async {
    await _timerRemoteDataSource.addTime(time: stopwatch.elapsedMilliseconds);
  }

  String getTime() {
    String formatTime(int milliseconds) {
      var secs = milliseconds ~/ 1000;
      var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
      var seconds = (secs % 60).toString().padLeft(2, '0');
      var miliseconds = ((milliseconds ~/ 10) % 100).toString().padLeft(2, '0');
      return "$minutes:$seconds:$miliseconds";
    }

    return formatTime(stopwatch.elapsedMilliseconds);
  }
}
