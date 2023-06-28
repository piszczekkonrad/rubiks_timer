import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_model.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_remote_data_source.dart';

@injectable
class TimesRepository {
  TimesRepository({required this.timesDataSource});
  final TimesDataSource timesDataSource;

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    var miliseconds = ((milliseconds ~/ 10) % 100).toString().padLeft(2, '0');
    return "$minutes:$seconds:$miliseconds";
  }

  Stream<List<TimesModel>> getStream() {
    return timesDataSource.getStream().map(
      (querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return TimesModel(
            time: formatTime(doc['time']),
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
