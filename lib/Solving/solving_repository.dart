import 'package:dio/dio.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';

class SolvingRepository {
  Future<SolvingModel?> getSolvingModel() async {
    final response = await Dio().get<Map<String, dynamic>>(
        "https://my-json-server.typicode.com/piszczekkonrad/rubiks_timer/whiteCross");
    final responseData = response.data;
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
