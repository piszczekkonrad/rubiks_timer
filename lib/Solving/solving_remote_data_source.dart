import 'package:dio/dio.dart';

class SolvingRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> getSolvingData() async {
    final response = await Dio().get<List<dynamic>>(
        "https://my-json-server.typicode.com/piszczekkonrad/rubiks_timer/OrientLastLayer");
    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
