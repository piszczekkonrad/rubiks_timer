import 'package:dio/dio.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';
import 'package:rubiks_timer/Solving/solving_remote_data_source.dart';

class SolvingRepository {
  SolvingRepository(this._solvingRemoteDataSource);
  final SolvingRemoteDataSource _solvingRemoteDataSource;

  Future<SolvingModel?> getSolvingModel() async {
    final responseData = await _solvingRemoteDataSource.getSolvingData();
    if (responseData == null) {
      return null;
    }
    final alghorithm = responseData["alghorithm"] as String;
    final id = responseData["id"] as int;
    final picture = responseData["picture"] as String;
    return SolvingModel(
      id: id,
      alghorithm: alghorithm,
      picture: picture,
    );
  }
}
