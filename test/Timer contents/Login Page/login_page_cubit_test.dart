import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rubiks_timer/Timer%20contents/Login%20Page/cubit/login_page_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Login%20Page/login_repository.dart';
import 'package:rubiks_timer/enums.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  late LoginPageCubit sut;
  late MockLoginRepository repository;

  setUp(() {
    repository = MockLoginRepository();
    sut = LoginPageCubit(repository);
  });

  group('start', () {
    blocTest<LoginPageCubit, LoginPageState>(
      "emits LoginStatus.login",
      build: () => sut,
      act: (cubit) => cubit.start(),
      expect: () => [
        LoginPageState(
          loginStatus: LoginStatus.login,
        )
      ],
    );
  });

  group('login', () {
    setUp(() {
      when(
        () => repository.login(email: 'email', password: 'password'),
      ).thenThrow(Exception('test error message'));
    });
    group('login failure with empty email and password', () {
      blocTest<LoginPageCubit, LoginPageState>(
        "emits LoginStatus.login with errorMessage 'Input email and password'",
        build: () => sut,
        act: (cubit) => cubit.login(email: '', password: ''),
        expect: () => [
          LoginPageState(
              loginStatus: LoginStatus.login,
              errorMessage: "Input email and password")
        ],
      );
    });

    group('login failure with empty email ', () {
      blocTest<LoginPageCubit, LoginPageState>(
        "emits LoginStatus.login with errorMessage 'Input email and password'",
        build: () => sut,
        act: (cubit) => cubit.login(email: '', password: 'password'),
        expect: () => [
          LoginPageState(
              loginStatus: LoginStatus.login,
              errorMessage: "Input email and password")
        ],
      );
    });

    group('login failure with empty password', () {
      blocTest<LoginPageCubit, LoginPageState>(
        "emits LoginStatus.login with errorMessage 'Input email and password'",
        build: () => sut,
        act: (cubit) => cubit.login(email: 'email', password: ''),
        expect: () => [
          LoginPageState(
              loginStatus: LoginStatus.login,
              errorMessage: "Input email and password")
        ],
      );
    });

    group('login failure with exception', () {
      blocTest<LoginPageCubit, LoginPageState>(
        "emits LoginStatus.login with errorMessage 'test error message' ",
        build: () => sut,
        act: (cubit) => cubit.login(email: 'email', password: 'password'),
        expect: () => [
          LoginPageState(
              loginStatus: LoginStatus.login,
              errorMessage: "Exception: test error message")
        ],
      );
    });
  });
  group('signUp', () {
    setUp(() {
      when(
        () => repository.signUp(email: 'email', password: 'password'),
      ).thenThrow(Exception('test error message'));
    });
    group('signUp failure with empty email and password', () {
      blocTest<LoginPageCubit, LoginPageState>(
        "emits LoginStatus.signUp with errorMessage 'Input email and password'",
        build: () => sut,
        act: (cubit) => cubit.signUp(email: '', password: ''),
        expect: () => [
          LoginPageState(
              loginStatus: LoginStatus.signUp,
              errorMessage: "Input email and password")
        ],
      );
    });

    group('signUp failure with empty email ', () {
      blocTest<LoginPageCubit, LoginPageState>(
        "emits LoginStatus.signUp with errorMessage 'Input email and password'",
        build: () => sut,
        act: (cubit) => cubit.signUp(email: '', password: 'password'),
        expect: () => [
          LoginPageState(
              loginStatus: LoginStatus.signUp,
              errorMessage: "Input email and password")
        ],
      );
    });

    group('signUp failure with empty password', () {
      blocTest<LoginPageCubit, LoginPageState>(
        "emits LoginStatus.login with errorMessage 'Input email and password'",
        build: () => sut,
        act: (cubit) => cubit.signUp(email: 'email', password: ''),
        expect: () => [
          LoginPageState(
              loginStatus: LoginStatus.signUp,
              errorMessage: "Input email and password")
        ],
      );
    });

    group('signUp failure with exception', () {
      blocTest<LoginPageCubit, LoginPageState>(
        "emits LoginStatus.signUp with errorMessage 'test error message' ",
        build: () => sut,
        act: (cubit) => cubit.signUp(email: 'email', password: 'password'),
        expect: () => [
          LoginPageState(
              loginStatus: LoginStatus.signUp,
              errorMessage: "Exception: test error message")
        ],
      );
    });
  });
  group('showLoginPage', () {
    blocTest<LoginPageCubit, LoginPageState>(
      "emits LoginStatus.login",
      build: () => sut,
      act: (cubit) => cubit.showLoginPage(),
      expect: () => [LoginPageState(loginStatus: LoginStatus.login)],
    );
  });
  group('showSignUpPage', () {
    blocTest<LoginPageCubit, LoginPageState>(
      "emits LoginStatus.signUp",
      build: () => sut,
      act: (cubit) => cubit.showSignUpPage(),
      expect: () => [LoginPageState(loginStatus: LoginStatus.signUp)],
    );
  });
}
