import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_model.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_remote_data_source.dart';

@injectable
class TimesRepository {
  TimesRepository({required this.timesDataSource});
  final TimesDataSource timesDataSource;

  Stream<List<TimesModel>> getStream() {
    return timesDataSource.getStream().map(
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
    return timesDataSource.delete(id: id);
  }
}
