import 'package:dio/dio.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';

class SolvingRepository {
  Future<SolvingModel?> getSolvingModel() async {
    final response = await Dio().get<Map<String, dynamic>>(
        "https://my-json-server.typicode.com/piszczekkonrad/rubiks_timer/db");
    final responseData = response.data;
    if (responseData == null) {
      return null;
    }
    final alghorithm = responseData["whiteCross"]["alghorithm"] as String;
    final id = responseData["whiteCross"]["id"] as int;
    final picture = responseData["whiteCross"]["picture"] as String;
    return SolvingModel(
      id: id,
      alghorithm: alghorithm,
      picture: picture,
    );
  }
}
