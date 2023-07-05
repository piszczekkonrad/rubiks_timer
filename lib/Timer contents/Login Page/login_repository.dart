import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/Timer%20contents/Login%20Page/login_remote_data_source.dart';

@injectable
class LoginRepository {
  LoginRepository(this._loginRemoteDataSource);
  final LoginRemoteDataSource _loginRemoteDataSource;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _loginRemoteDataSource.login(email: email, password: password);
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await _loginRemoteDataSource.signUp(email: email, password: password);
  }

  Future<void> signOut() async {
    await _loginRemoteDataSource.signOut();
  }

  Stream<User?> getUserStream() {
    return _loginRemoteDataSource.getUserStream();
  }
}
