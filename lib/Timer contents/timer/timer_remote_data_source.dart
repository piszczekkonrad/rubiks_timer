import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class TimerRemoteDataSource {
  final userID = FirebaseAuth.instance.currentUser?.uid;
  Future<void> addTime({required int time}) async {
    if (userID != null) {
      FirebaseFirestore.instance
          .collection('user')
          .doc(userID)
          .collection('times')
          .add(
        {
          'time': time,
        },
      );
    }
  }
}
