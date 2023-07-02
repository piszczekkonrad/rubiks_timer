import 'package:bloc_test/bloc_test.dart';
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
  group("timeStart()", () {
    setUp(() {
      when(
        () => repository.getTime(),
      ).thenAnswer((_) => "00:10:00");
    });
    blocTest<TimerCubit, TimerState>(
        'should emit TimerStatus.reseting, actual time of the stopwatch and empty error message',
        build: () => sut,
        act: (cubit) => cubit.timeStart(),
        expect: () => [
              TimerState(
                timerStatus: TimerStatus.reseting,
                time: "00:10:00",
                errorMessage: '',
              ),
            ],
        verify: (_) {
          verify(() => repository.start()).called(1);
        });
  });
  group("timeStop()", () {
    setUp(() {
      when(
        () => repository.getTime(),
      ).thenReturn("00:10:00");
    });
    blocTest<TimerCubit, TimerState>(
        'should emit TimerStatus.reseting, actual time of the stopwatch and empty error message',
        build: () => sut,
        act: (cubit) => cubit.timeStop(),
        expect: () => [
              TimerState(
                timerStatus: TimerStatus.reseting,
                time: "00:10:00",
                errorMessage: '',
              ),
            ],
        verify: (_) {
          verify(
            () => repository.stop(),
          ).called(1);
        });
  });

  group("timeReset()", () {
    setUp(() {
      when(
        () => repository.getTime(),
      ).thenAnswer((_) => "00:00:00");
    });
    blocTest<TimerCubit, TimerState>(
        'should reset timer in TimerRepository emit TimerStatus.stopped, actual time of the stopwatch and empty error message',
        build: () => sut,
        act: (cubit) => cubit.timeReset(),
        expect: () async => [
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
}
