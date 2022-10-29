import 'package:rubiks_timer/Solving/solving_model.dart';
import 'package:rubiks_timer/Solving/solving_remote_data_source.dart';

class SolvingRepository {
  SolvingRepository(this._solvingRemoteDataSource);
  final SolvingRemoteRetrofitDataSource _solvingRemoteDataSource;

  Future<List<SolvingModel>> getFLModel() async {
    return _solvingRemoteDataSource.getFLData();
  }

  Future<List<SolvingModel>> getSLModel() async {
    return _solvingRemoteDataSource.getSLData();
  }

  Future<List<SolvingModel>> getYCModel() async {
    return _solvingRemoteDataSource.getYCData();
  }

  Future<List<SolvingModel>> getPLLModel() async {
    return _solvingRemoteDataSource.getPLLData();
  }

  Future<List<SolvingModel>> getOLLModel() async {
    return _solvingRemoteDataSource.getOLLData();
  }
}
