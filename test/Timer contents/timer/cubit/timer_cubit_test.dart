import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rubiks_timer/Timer%20contents/timer/cubit/timer_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/timer/timer_repository.dart';
import 'package:rubiks_timer/enums.dart';

class MockTimerRepository extends Mock implements TimerRepository {
  @override
  final stopwatch = Stopwatch();
}

void main() {
  late TimerCubit sut;
  late TimerRepository repository;

  setUp(() {
    repository = MockTimerRepository();
    sut = TimerCubit(timerRepository: repository);
  });
  group("start()", () {
    setUp(() {
      when(
        () => repository.getTime(),
      ).thenAnswer((_) => "00:00:00");
    });
    blocTest<TimerCubit, TimerState>(
        'should emit TimerStatus.stopped, actual time of the stopwatch and empty error message',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
              TimerState(
                timerStatus: TimerStatus.stopped,
                time: "00:00:00",
                errorMessage: '',
              ),
            ]);
  });
  group("timer calls", () {
    setUp(() {
      when(
        () => repository.getTime(),
      ).thenAnswer((_) => "00:10:00");
      when(
        () => repository.start(),
      ).thenAnswer((_) async => VoidCallback);
    });
    group("timeStart()", () {
      blocTest<TimerCubit, TimerState>(
          'should emit TimerStatus.running, actual time of the stopwatch and empty error message',
          build: () => sut,
          act: (cubit) => cubit.timeStart(),
          wait: const Duration(seconds: 10),
          expect: () => [
                TimerState(
                  timerStatus: TimerStatus.running,
                  time: "00:10:00",
                  errorMessage: '',
                ),
              ],
          verify: (_) {
            verify(() => repository.start()).called(1);
          });
    });

    group("timeStop", () {
      blocTest<TimerCubit, TimerState>(
          'should emit TimerStatus.running, actual time of the stopwatch and empty error message',
          build: () => sut,
          act: (cubit) => cubit.timeStart(),
          wait: const Duration(seconds: 10),
          expect: () => [
                TimerState(
                  timerStatus: TimerStatus.running,
                  time: "00:10:00",
                  errorMessage: '',
                ),
              ],
          verify: (_) {
            verify(() => repository.start()).called(1);
          });
    });
    group("timeReset()", () {
      setUp(() {
        when(
          () => repository.getTime(),
        ).thenAnswer((_) => "00:00:00");
        when(
          () => repository.reset(),
        ).thenAnswer((_) async => VoidCallback);
      });
      blocTest<TimerCubit, TimerState>(
          'should reset timer in TimerRepository emit TimerStatus.stopped, actual time of the stopwatch and empty error message',
          build: () => sut,
          act: (cubit) => cubit.timeReset(),
          expect: () => [
                TimerState(
                  timerStatus: TimerStatus.stopped,
                  time: "00:00:00",
                  errorMessage: '',
                ),
              ],
          verify: (_) {
            verify(() => repository.reset()).called(1);
          });
    });
  });
  group("Add time", () {
    setUp(() {
      when(
        () => repository.getTime(),
      ).thenAnswer((_) => "00:10:00");
      when(
        () => repository.addTime(),
      ).thenAnswer((_) async => VoidCallback);
    });
    blocTest<TimerCubit, TimerState>(
        "Should call TimerRepository addTime(), then emit TimerStatus.saved, actual time of the stopwatch and empty error message",
        build: () => sut,
        act: (cubit) => cubit.addTime(),
        expect: () => [
              TimerState(
                timerStatus: TimerStatus.saved,
                time: "00:10:00",
                errorMessage: '',
              ),
            ]);
  });
}
