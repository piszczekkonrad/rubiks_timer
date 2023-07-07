import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rubiks_timer/Timer%20contents/Login%20Page/login_repository.dart';
import 'package:rubiks_timer/Timer%20contents/Root/cubit/timer_root_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

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
  late MockUser user;
  late LoginRepository repository;
  late TimerRootCubit sut;
  setUp(() {
    repository = MockLoginRepository();
    sut = TimerRootCubit(repository);
    user = MockUser();
  });

  group("start", () {
    setUp(() {
      when(
        () => repository.getUserStream(),
      ).thenAnswer((_) => Stream.value(user));
    });

    blocTest<TimerRootCubit, TimerRootState>(
      'emits user: null and index: 0 then user and index: 0.',
      build: () => sut,
      act: (cubit) => cubit.start(),
      expect: () => [
        TimerRootState(
          user: null,
          index: 0,
        ),
        TimerRootState(
          user: user,
          index: 0,
        ),
      ],
    );
  });
  group('signOut', () {
    setUp(() {
      when(
        () => repository.signOut(),
      ).thenAnswer((_) async => VoidCallback);
    });
    blocTest<TimerRootCubit, TimerRootState>('calls signout function',
        build: () => sut,
        act: (cubit) => cubit.signOut(),
        verify: (_) {
          verify(() => repository.signOut()).called(1);
        });
  });
  group("setIndex", () {
    setUp(() {
      when(
        () => repository.getUserStream(),
      ).thenAnswer((_) => Stream.value(user));
    });

    blocTest<TimerRootCubit, TimerRootState>(
      'emits user and new index given',
      build: () => sut,
      act: (cubit) => cubit.setIndex(1),
      expect: () => [
        TimerRootState(
          user: user,
          index: 1,
        ),
      ],
    );
  });
}
