import 'package:dio/dio.dart';

class SolvingRemoteDataSource {
  Future<Map<String, dynamic>?> getSolvingData() async {
    final response = await Dio().get<Map<String, dynamic>>(
        "https://my-json-server.typicode.com/piszczekkonrad/rubiks_timer/whiteCross");
    return response.data;
  }
}
