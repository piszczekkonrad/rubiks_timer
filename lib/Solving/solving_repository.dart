import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';
import 'package:rubiks_timer/Solving/solving_remote_data_source.dart';

@injectable
class SolvingRepository {
  SolvingRepository({required this.solvingRemoteDataSource});
  final SolvingRemoteRetrofitDataSource solvingRemoteDataSource;

  Future<List<SolvingModel>> getFLModel() async {
    return solvingRemoteDataSource.getFLData();
  }

  Future<List<SolvingModel>> getSLModel() async {
    return solvingRemoteDataSource.getSLData();
  }

  Future<List<SolvingModel>> getYCModel() async {
    return solvingRemoteDataSource.getYCData();
  }

  Future<List<SolvingModel>> getPLLModel() async {
    return solvingRemoteDataSource.getPLLData();
  }

  Future<List<SolvingModel>> getOLLModel() async {
    return solvingRemoteDataSource.getOLLData();
  }
}
