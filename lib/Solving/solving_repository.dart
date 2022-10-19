import 'package:dio/dio.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';
import 'package:rubiks_timer/Solving/solving_remote_data_source.dart';

class SolvingRepository {
  SolvingRepository(this._solvingRemoteDataSource);
  final SolvingRemoteDataSource _solvingRemoteDataSource;

  Future<SolvingModel?> getSolvingModel() async {
    final json = await _solvingRemoteDataSource.getSolvingData();
    if (json == null) {
      return null;
    }
    return SolvingModel.fromJson(json);
  }
}
