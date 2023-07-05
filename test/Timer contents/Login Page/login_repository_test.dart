import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rubiks_timer/Timer%20contents/Login%20Page/login_remote_data_source.dart';
import 'package:rubiks_timer/Timer%20contents/Login%20Page/login_repository.dart';

import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

class MockLoginRemoteDataSource extends Mock implements LoginRemoteDataSource {}

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

typedef Callback = void Function(MethodCall call);

void setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();
}

void main() async {
  // TestWidgetsFlutterBinding.ensureInitialized(); Gets called in setupFirebaseAuthMocks()
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });
  late LoginRepository sut;
  late MockLoginRemoteDataSource dataSource;
  late User? user;
  late MockUserCredential userCredential;
  setUp(() {
    dataSource = MockLoginRemoteDataSource();
    sut = LoginRepository(dataSource);
    userCredential = MockUserCredential();
    user = userCredential.user;
  });
  group('login', () {
    test('should call login() from dataSource', () async {
      //1
      when(
        () => dataSource.login(email: 'email', password: 'password'),
      ).thenAnswer((_) async => VoidCallback);
      //2

      final results = await sut.login(email: 'email', password: 'password');
      //3
      verify(
        () => dataSource.login(email: 'email', password: 'password'),
      ).called(1);
    });
  });

  group('signUp', () {
    test('should call signUp() from dataSource', () async {
      //1
      when(
        () => dataSource.signUp(email: 'email', password: 'password'),
      ).thenAnswer((_) async => VoidCallback);
      //2

      final results = await sut.signUp(email: 'email', password: 'password');
      //3
      verify(
        () => dataSource.signUp(email: 'email', password: 'password'),
      ).called(1);
    });
  });

  group('signOut', () {
    test('should call signOut() from dataSource', () async {
      //1
      when(
        () => dataSource.signOut(),
      ).thenAnswer((_) async => VoidCallback);
      //2

      final results = await sut.signOut();
      //3
      verify(
        () => dataSource.signOut(),
      ).called(1);
    });
  });
  group('getUserStream', () {
    group('Logged in', () {
      test('Should call dataSource.getUserStream() and return Stream<User?>',
          () {
        //1
        when(
          () => dataSource.getUserStream(),
        ).thenAnswer((_) => Stream.value(user));
        //2
        final results = dataSource.getUserStream();
        //3
        verify(
          () => dataSource.getUserStream(),
        ).called(1);
      });
    });
    group('not Logged in', () {
      test('Should return null', () {
        //1
        when(
          () => dataSource.getUserStream(),
        ).thenAnswer((_) => Stream.value(null));
        //2
        final results = dataSource.getUserStream();
        //3
        verify(
          () => dataSource.getUserStream(),
        ).called(1);
      });
    });
  });
}