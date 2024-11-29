import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rikaz_team/core/errors/failure.dart';
import 'package:rikaz_team/features/add_user_feature/data/models/create_user_request.dart';
import 'package:rikaz_team/features/login_feature/data/apis/api_service.dart';

class CreateUserRepo {
  final ApiService _apiService;

  CreateUserRepo({required ApiService apiService}) : _apiService = apiService;

  Future<Either<Failure, Map<String , dynamic>>> createuser(
      CreateUserRequest createUserRequest) async {
    try {
      var response = await _apiService.createuser(createUserRequest);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}