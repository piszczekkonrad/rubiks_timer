import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/Timer%20contents/login_repository.dart';

import '../../../enums.dart';

part 'login_page_state.dart';
part 'login_page_cubit.freezed.dart';

@injectable
class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit(this._loginRepository)
      : super(LoginPageState(
          loginStatus: LoginStatus.login,
        ));
  Future<void> start() async {
    emit(LoginPageState(
      loginStatus: LoginStatus.login,
    ));
  }

  final LoginRepository _loginRepository;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      emit(
        LoginPageState(
            loginStatus: LoginStatus.login,
            errorMessage: "Input email and password"),
      );
    } else {
      try {
        await _loginRepository.login(email: email, password: password);
      } catch (error) {
        emit(
          LoginPageState(
            loginStatus: LoginStatus.login,
            errorMessage: error.toString(),
          ),
        );
      }
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      emit(
        LoginPageState(
            loginStatus: LoginStatus.signUp,
            errorMessage: "Input email and password"),
      );
    } else {
      try {
        await _loginRepository.signUp(email: email, password: password);
      } catch (error) {
        emit(
          LoginPageState(
            loginStatus: LoginStatus.signUp,
            errorMessage: error.toString(),
          ),
        );
      }
    }
  }

  Future<void> showLoginPage() async {
    emit(LoginPageState(loginStatus: LoginStatus.login));
  }

  Future<void> showSignUpPage() async {
    emit(LoginPageState(loginStatus: LoginStatus.signUp));
  }
}
