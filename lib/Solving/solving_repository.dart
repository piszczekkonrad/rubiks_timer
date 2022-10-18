import 'package:dio/dio.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';

class SolvingRepository {
  Future<SolvingModel?> getSolvingModel() async {
    final response = await Dio().get(
        "https://my-json-server.typicode.com/piszczekkonrad/rubiks_timer/WhiteCross");

    return SolvingModel(
      id: 0,
      alghorithm: "alghorithm",
      picture: "picture",
    );
  }
}
//https://my-json-server.typicode.com/piszczekkonrad/rubiks_timer/WhiteCross