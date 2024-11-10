import 'package:dio/dio.dart';
import 'package:rikaz_team/core/network/api_constances.dart';
import 'package:rikaz_team/features/add_user_feature/data/models/create_user_request.dart';
import 'package:rikaz_team/features/login_feature/data/models/login_request.dart';

class ApiService {
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;

  Future<Map<String , dynamic>> login(LoginRequest loginRequest) async {
    var response = await _dio.post(
      ApiConstances.loginUrl,
      data: loginRequest.toJson(),
    );
    return response.data;
  }

  Future<Map<String , dynamic>> createuser(CreateUserRequest createUserRequest) async {
    var response = await _dio.post(
      ApiConstances.createUserUrl,
      data: createUserRequest.toJson(),
    );
    return response.data;
  }

}
