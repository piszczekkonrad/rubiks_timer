import 'package:rubiks_timer/Times%20Page/times_model.dart';
import 'package:rubiks_timer/Times%20Page/times_remote_data_source.dart';

class TimesRepository {
  TimesRepository(this._timesDataSource);
  final TimesDataSource _timesDataSource;

  Stream<List<TimesModel>> getStream() {
    return _timesDataSource.getStream().map(
      (querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return TimesModel(
            time: doc['time'],
            id: doc.id,
          );
        }).toList();
      },
    );
  }

  Future<void> delete({required String id}) {
    return _timesDataSource.delete(id: id);
  }
}
