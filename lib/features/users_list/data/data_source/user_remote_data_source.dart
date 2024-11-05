import 'package:rikaz_team/features/users_list/data/model/user_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_constances.dart';

abstract class BaseUserRemoteDataSource {
  Future<List<UserModel>> getUsersList();
}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  @override
  Future<List<UserModel>> getUsersList() async {
    try {
      final response = await Dio().get(ApiConstances.getUsersListUrl);
      // print(response.data);
      return List<UserModel>.from(
          (response.data['data'] as List).map((e) => UserModel.fromJson(e)));
    } on DioException catch (e) {
      print(e.response);
      throw Exception('Failed to login: $e');
    }
  }
}
