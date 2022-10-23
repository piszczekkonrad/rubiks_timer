import 'package:rubiks_timer/Solving/solving_model.dart';
import 'package:rubiks_timer/Solving/solving_remote_data_source.dart';

class SolvingRepository {
  SolvingRepository(this._solvingRemoteDataSource);
  final SolvingRemoteDioDataSource _solvingRemoteDataSource;

  Future<List<SolvingModel>> getSolvingModel() async {
    final json = await _solvingRemoteDataSource.getSolvingData();
    if (json == null) {
      return [];
    }
    return json.map((item) => SolvingModel.fromJson(item)).toList();
  }
}
