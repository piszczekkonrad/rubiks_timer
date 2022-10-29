import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';

part 'solving_remote_data_source.g.dart';

@RestApi(
    baseUrl: "https://my-json-server.typicode.com/piszczekkonrad/rubiks_timer")
abstract class SolvingRemoteRetrofitDataSource {
  factory SolvingRemoteRetrofitDataSource(Dio dio, {String baseUrl}) =
      _SolvingRemoteRetrofitDataSource;

  @GET("/FirstLayer")
  Future<List<SolvingModel>> getFLData();
  @GET("/SecondLayer")
  Future<List<SolvingModel>> getSLData();
  @GET("/YellowCross")
  Future<List<SolvingModel>> getYCData();
  @GET("/PermuteLastLayer")
  Future<List<SolvingModel>> getPLLData();
  @GET("OrientLastLayer")
  Future<List<SolvingModel>> getOLLData();
}

// class SolvingRemoteDioDataSource {
//   Future<List<Map<String, dynamic>>?> getSolvingData() async {
//     final response = await Dio().get<List<dynamic>>(
//         "https://my-json-server.typicode.com/piszczekkonrad/rubiks_timer/FirstLayer");
//     final listDynamic = response.data;
//     if (listDynamic == null) {
//       return null;
//     }
//     return listDynamic.map((e) => e as Map<String, dynamic>).toList();
//   }
// }
