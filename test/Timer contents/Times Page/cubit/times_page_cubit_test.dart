import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/cubit/times_page_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_model.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_repository.dart';

class MockTimesRepository extends Mock implements TimesRepository {}

void main() {
  late TimesPageCubit sut;
  late TimesRepository repository;

  setUp(() {
    repository = MockTimesRepository();
    sut = TimesPageCubit(timesRepository: repository);
  });

  group("start", () {
    setUp(() {
      when(
        () => repository.getStream(),
      ).thenAnswer((_) => Stream.value(<TimesModel>[
            TimesModel(time: "10", id: "1"),
            TimesModel(time: "20", id: "2"),
            TimesModel(time: "30", id: "3"),
          ]));
    });
    blocTest<TimesPageCubit, TimesPageState>(
        "Should emit empty list empty error message and isLoading: true then list of TimeModels empty error message and isLoading: false ",
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
              TimesPageState(
                times: [],
                errorMessage: '',
                isLoading: true,
              ),
              TimesPageState(
                times: [
                  TimesModel(time: "10", id: "1"),
                  TimesModel(time: "20", id: "2"),
                  TimesModel(time: "30", id: "3"),
                ],
                errorMessage: '',
                isLoading: false,
              )
            ]);
  });
  group('delete', () {
    setUp(() {
      when(
        () => repository.delete(id: "id"),
      ).thenAnswer((_) async => VoidCallback);
    });
    blocTest<TimesPageCubit, TimesPageState>(
        'Calls delete() from Times repository',
        build: () => sut,
        act: (cubit) => cubit.delete("id"),
        verify: (_) {
          verify(
            () => repository.delete(id: "id"),
          ).called(1);
        });
  });
}
