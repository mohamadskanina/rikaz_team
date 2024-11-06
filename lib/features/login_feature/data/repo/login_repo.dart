import 'package:dio/dio.dart';
import 'package:rikaz_team/core/errors/failure.dart';
import 'package:rikaz_team/features/login_feature/data/apis/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:rikaz_team/features/login_feature/data/models/login_request.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo({required ApiService apiService}) : _apiService = apiService;

  Future<Either<Failure, Map<String , dynamic>>> login(
      LoginRequest loginRequest) async {
    try {
      var response = await _apiService.login(loginRequest);
      print("left response");
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
