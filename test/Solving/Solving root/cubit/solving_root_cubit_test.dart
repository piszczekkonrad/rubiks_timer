import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/cubit/solving_root_cubit.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';
import 'package:rubiks_timer/Solving/solving_repository.dart';
import 'package:rubiks_timer/enums.dart';

class MockSolvingRepository extends Mock implements SolvingRepository {}

void main() {
  late SolvingRootCubit sut;
  late MockSolvingRepository repository;

  setUp(() {
    repository = MockSolvingRepository();
    sut = SolvingRootCubit(solvingRepository: repository);
  });

  group('firstLayer', () {
    group("succes", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => true));
        when(
          () => repository.getFLModel(),
        ).thenAnswer(((_) async => [
              SolvingModel(0, 'FUF1', 'picture1'),
              SolvingModel(0, 'FUF2', 'picture2'),
              SolvingModel(0, 'FUF3', 'picture3'),
            ]));
      });

      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.firstLayer with results',
        build: () => sut,
        act: (cubit) => cubit.firstLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            results: [
              SolvingModel(0, 'FUF1', 'picture1'),
              SolvingModel(0, 'FUF2', 'picture2'),
              SolvingModel(0, 'FUF3', 'picture3'),
            ],
            status: SolvingStatus.firstLayer,
          ),
        ],
      );
    });
    group("failure", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => true));
        when(
          () => repository.getFLModel(),
        ).thenThrow(Exception('error'));
      });

      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.error with error message',
        build: () => sut,
        act: (cubit) => cubit.firstLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            status: SolvingStatus.error,
            errorMessage: 'Exception: error',
          ),
        ],
      );
    });
    group("failure due to no network connection", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => false));
      });
      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.error with error message',
        build: () => sut,
        act: (cubit) => cubit.firstLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            status: SolvingStatus.error,
            errorMessage:
                'Network connection required. Please go back, and try with internet connection',
          ),
        ],
      );
    });
  });
  group('secondLayer', () {
    group("succes", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => true));
        when(
          () => repository.getSLModel(),
        ).thenAnswer(((_) async => [
              SolvingModel(0, 'FUF1', 'picture1'),
              SolvingModel(0, 'FUF2', 'picture2'),
              SolvingModel(0, 'FUF3', 'picture3'),
            ]));
      });

      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.secondLayer with results',
        build: () => sut,
        act: (cubit) => cubit.secondLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            results: [
              SolvingModel(0, 'FUF1', 'picture1'),
              SolvingModel(0, 'FUF2', 'picture2'),
              SolvingModel(0, 'FUF3', 'picture3'),
            ],
            status: SolvingStatus.secondLayer,
          ),
        ],
      );
    });
    group("failure", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => true));
        when(
          () => repository.getSLModel(),
        ).thenThrow(Exception('error'));
      });

      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.error with error message',
        build: () => sut,
        act: (cubit) => cubit.secondLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            status: SolvingStatus.error,
            errorMessage: 'Exception: error',
          ),
        ],
      );
    });
    group("failure due to no network connection", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => false));
      });
      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.error with error message',
        build: () => sut,
        act: (cubit) => cubit.secondLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            status: SolvingStatus.error,
            errorMessage:
                'Network connection required. Please go back, and try with internet connection',
          ),
        ],
      );
    });
  });
  group('yellowCross', () {
    group("succes", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => true));
        when(
          () => repository.getYCModel(),
        ).thenAnswer(((_) async => [
              SolvingModel(0, 'FUF1', 'picture1'),
              SolvingModel(0, 'FUF2', 'picture2'),
              SolvingModel(0, 'FUF3', 'picture3'),
            ]));
      });

      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.yellowCross with results',
        build: () => sut,
        act: (cubit) => cubit.yellowCross(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            results: [
              SolvingModel(0, 'FUF1', 'picture1'),
              SolvingModel(0, 'FUF2', 'picture2'),
              SolvingModel(0, 'FUF3', 'picture3'),
            ],
            status: SolvingStatus.yellowCross,
          ),
        ],
      );
    });
    group("failure", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => true));
        when(
          () => repository.getYCModel(),
        ).thenThrow(Exception('error'));
      });

      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.error with error message',
        build: () => sut,
        act: (cubit) => cubit.yellowCross(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            status: SolvingStatus.error,
            errorMessage: 'Exception: error',
          ),
        ],
      );
    });
    group("failure due to no network connection", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => false));
      });
      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.error with error message',
        build: () => sut,
        act: (cubit) => cubit.yellowCross(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            status: SolvingStatus.error,
            errorMessage:
                'Network connection required. Please go back, and try with internet connection',
          ),
        ],
      );
    });
  });
  group('permuteLastLayer', () {
    group("succes", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => true));
        when(
          () => repository.getPLLModel(),
        ).thenAnswer(((_) async => [
              SolvingModel(0, 'FUF1', 'picture1'),
              SolvingModel(0, 'FUF2', 'picture2'),
              SolvingModel(0, 'FUF3', 'picture3'),
            ]));
      });

      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.pll with results',
        build: () => sut,
        act: (cubit) => cubit.permuteLastLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            results: [
              SolvingModel(0, 'FUF1', 'picture1'),
              SolvingModel(0, 'FUF2', 'picture2'),
              SolvingModel(0, 'FUF3', 'picture3'),
            ],
            status: SolvingStatus.pll,
          ),
        ],
      );
    });
    group("failure", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => true));
        when(
          () => repository.getPLLModel(),
        ).thenThrow(Exception('error'));
      });

      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.error with error message',
        build: () => sut,
        act: (cubit) => cubit.permuteLastLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            status: SolvingStatus.error,
            errorMessage: 'Exception: error',
          ),
        ],
      );
    });
    group("failure due to no network connection", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => false));
      });
      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.error with error message',
        build: () => sut,
        act: (cubit) => cubit.permuteLastLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            status: SolvingStatus.error,
            errorMessage:
                'Network connection required. Please go back, and try with internet connection',
          ),
        ],
      );
    });
  });
  group('orientLastLayer', () {
    group("succes", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => true));
        when(
          () => repository.getOLLModel(),
        ).thenAnswer(((_) async => [
              SolvingModel(0, 'FUF1', 'picture1'),
              SolvingModel(0, 'FUF2', 'picture2'),
              SolvingModel(0, 'FUF3', 'picture3'),
            ]));
      });

      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.oll with results',
        build: () => sut,
        act: (cubit) => cubit.orientLastLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            results: [
              SolvingModel(0, 'FUF1', 'picture1'),
              SolvingModel(0, 'FUF2', 'picture2'),
              SolvingModel(0, 'FUF3', 'picture3'),
            ],
            status: SolvingStatus.oll,
          ),
        ],
      );
    });
    group("failure", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => true));
        when(
          () => repository.getOLLModel(),
        ).thenThrow(Exception('error'));
      });

      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.error with error message',
        build: () => sut,
        act: (cubit) => cubit.orientLastLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            status: SolvingStatus.error,
            errorMessage: 'Exception: error',
          ),
        ],
      );
    });
    group("failure due to no network connection", () {
      setUp(() {
        when(
          () => repository.internetAvailable(),
        ).thenAnswer(((_) async => false));
      });
      blocTest<SolvingRootCubit, SolvingRootState>(
        'emits Status.loading, then SolvingStatus.error with error message',
        build: () => sut,
        act: (cubit) => cubit.orientLastLayer(),
        expect: () => [
          SolvingRootState(
            status: SolvingStatus.loading,
          ),
          SolvingRootState(
            status: SolvingStatus.error,
            errorMessage:
                'Network connection required. Please go back, and try with internet connection',
          ),
        ],
      );
    });
  });
}
