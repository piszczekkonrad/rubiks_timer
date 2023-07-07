// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rubiks_timer/Timer%20contents/timer/timer_remote_data_source.dart';
import 'package:rubiks_timer/Timer%20contents/timer/timer_repository.dart';

class MockTimerRemoteDataSource extends Mock implements TimerRemoteDataSource {}

void main() {
  late TimerRepository sut;
  late MockTimerRemoteDataSource dataSource;
  late Stopwatch stopwatch;
  setUp(() {
    dataSource = MockTimerRemoteDataSource();
    sut = TimerRepository(dataSource);
    stopwatch = Stopwatch();
  });

  group('start', () {
    test('Should send current elapsed time of stopwatch in milliseconds',
        () async {
      //1
      when(
        () => dataSource.addTime(time: stopwatch.elapsedMilliseconds),
      ).thenAnswer((_) async => VoidCallback);
//2
      final results = await sut.addTime();
//3
      verify(
        () => dataSource.addTime(time: stopwatch.elapsedMilliseconds),
      ).called(1);
    });
  });
  group('formatTime', () {
    test(
        'Should return current formated elapse time of stopwatch in String format',
        () {
      final results = sut.getTime();
      expect(results, "00:00:00");
    });
  });
}
