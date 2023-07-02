import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class TimesDataSource {
  final userID = FirebaseAuth.instance.currentUser?.uid;
  Stream<QuerySnapshot> getStream() {
    if (userID == null) {
      throw Exception('User not logged in');
    }
    try {
      return FirebaseFirestore.instance
          .collection('user')
          .doc(userID)
          .collection('times')
          .orderBy('time')
          .snapshots();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> delete({required String id}) {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(userID)
        .collection('times')
        .doc(id)
        .delete();
  }
}
