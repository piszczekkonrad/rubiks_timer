import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';
import 'package:rubiks_timer/Solving/solving_remote_data_source.dart';
import 'package:rubiks_timer/Solving/solving_repository.dart';

class MockSolvingDataSource extends Mock
    implements SolvingRemoteRetrofitDataSource {}

void main() {
  late SolvingRepository sut;
  late MockSolvingDataSource dataSource;
  setUp(() {
    dataSource = MockSolvingDataSource();
    sut = SolvingRepository(solvingRemoteDataSource: dataSource);
  });
  group("getSolvingData", () {
    test("should call remoteDataSource.getFLModel() method", () async {
      when(() => dataSource.getFLData()).thenAnswer(
        (_) async => [],
      );
      await sut.getFLModel();
      verify(() => dataSource.getFLData()).called(1);
    });
    test("Should return list of solvingModels", () async {
      when(() => dataSource.getFLData()).thenAnswer(
        (_) async => [
          SolvingModel(0, "alghorithm0", "picture0"),
          SolvingModel(1, "alghorithm1", "picture1"),
          SolvingModel(2, "alghorithm2", "picture2"),
        ],
      );
      final results = await sut.getFLModel();
      expect(results, [
        SolvingModel(0, "alghorithm0", "picture0"),
        SolvingModel(1, "alghorithm1", "picture1"),
        SolvingModel(2, "alghorithm2", "picture2"),
      ]);
    });
    test("should call remoteDataSource.getSLModel() method", () async {
      when(() => dataSource.getSLData()).thenAnswer(
        (_) async => [],
      );
      await sut.getSLModel();
      verify(() => dataSource.getSLData()).called(1);
    });
    test("Should return list of solvingModels", () async {
      when(() => dataSource.getSLData()).thenAnswer(
        (_) async => [
          SolvingModel(0, "alghorithm0", "picture0"),
          SolvingModel(1, "alghorithm1", "picture1"),
          SolvingModel(2, "alghorithm2", "picture2"),
        ],
      );
      final results = await sut.getSLModel();
      expect(results, [
        SolvingModel(0, "alghorithm0", "picture0"),
        SolvingModel(1, "alghorithm1", "picture1"),
        SolvingModel(2, "alghorithm2", "picture2"),
      ]);
    });
    test("should call remoteDataSource.getYCModel() method", () async {
      when(() => dataSource.getYCData()).thenAnswer(
        (_) async => [],
      );
      await sut.getYCModel();
      verify(() => dataSource.getYCData()).called(1);
    });
    test("Should return list of solvingModels", () async {
      when(() => dataSource.getYCData()).thenAnswer(
        (_) async => [
          SolvingModel(0, "alghorithm0", "picture0"),
          SolvingModel(1, "alghorithm1", "picture1"),
          SolvingModel(2, "alghorithm2", "picture2"),
        ],
      );
      final results = await sut.getYCModel();
      expect(results, [
        SolvingModel(0, "alghorithm0", "picture0"),
        SolvingModel(1, "alghorithm1", "picture1"),
        SolvingModel(2, "alghorithm2", "picture2"),
      ]);
    });
    test("should call remoteDataSource.getPLLModel() method", () async {
      when(() => dataSource.getPLLData()).thenAnswer(
        (_) async => [],
      );
      await sut.getPLLModel();
      verify(() => dataSource.getPLLData()).called(1);
    });
    test("Should return list of solvingModels", () async {
      when(() => dataSource.getPLLData()).thenAnswer(
        (_) async => [
          SolvingModel(0, "alghorithm0", "picture0"),
          SolvingModel(1, "alghorithm1", "picture1"),
          SolvingModel(2, "alghorithm2", "picture2"),
        ],
      );
      final results = await sut.getPLLModel();
      expect(results, [
        SolvingModel(0, "alghorithm0", "picture0"),
        SolvingModel(1, "alghorithm1", "picture1"),
        SolvingModel(2, "alghorithm2", "picture2"),
      ]);
    });
    test("should call remoteDataSource.getOLLModel() method", () async {
      when(() => dataSource.getOLLData()).thenAnswer(
        (_) async => [],
      );
      await sut.getOLLModel();
      verify(() => dataSource.getOLLData()).called(1);
    });
    test("Should return list of solvingModels", () async {
      when(() => dataSource.getOLLData()).thenAnswer(
        (_) async => [
          SolvingModel(0, "alghorithm0", "picture0"),
          SolvingModel(1, "alghorithm1", "picture1"),
          SolvingModel(2, "alghorithm2", "picture2"),
        ],
      );
      final results = await sut.getOLLModel();
      expect(results, [
        SolvingModel(0, "alghorithm0", "picture0"),
        SolvingModel(1, "alghorithm1", "picture1"),
        SolvingModel(2, "alghorithm2", "picture2"),
      ]);
    });
  });
}
