import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class TimerRepository {
  TimerRepository();

  final stopwatch = Stopwatch();
  final userID = FirebaseAuth.instance.currentUser?.uid;
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
    if (userID != null) {
      FirebaseFirestore.instance
          .collection('user')
          .doc(userID)
          .collection('times')
          .add(
        {
          'time': stopwatch.elapsedMilliseconds,
        },
      );
    }
  }

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    var miliseconds = ((milliseconds ~/ 10) % 100).toString().padLeft(2, '0');
    return "$minutes:$seconds:$miliseconds";
  }

  String getTime() {
    return formatTime(stopwatch.elapsedMilliseconds);
  }
}
