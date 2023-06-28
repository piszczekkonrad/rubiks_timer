import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginRepository {
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Stream<User?> getUserStream() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
