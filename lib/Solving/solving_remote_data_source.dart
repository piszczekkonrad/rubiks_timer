import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';

part 'solving_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class SolvingRemoteRetrofitDataSource {
  @factoryMethod
  factory SolvingRemoteRetrofitDataSource(Dio dio) =
      _SolvingRemoteRetrofitDataSource;

  @GET("/FirstLayer")
  Future<List<SolvingModel>> getFLData();
  @GET("/SecondLayer")
  Future<List<SolvingModel>> getSLData();
  @GET("/YellowCross")
  Future<List<SolvingModel>> getYCData();
  @GET("/PermuteLastLayer")
  Future<List<SolvingModel>> getPLLData();
  @GET("/OrientLastLayer")
  Future<List<SolvingModel>> getOLLData();
}
