import 'package:rikaz_team/features/users_list/data/model/user_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_constances.dart';
import '../../../../core/network/error_message.dart';

abstract class BaseUserRemoteDataSource {
  Future<List<UserModel>> getUsersList();
}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  @override
  Future<List<UserModel>> getUsersList() async {
    try {
      final response = await Dio().get(ApiConstances.getUsersListUrl);
      print(response.data);
      return List<UserModel>.from(
          (response.data['data'] as List).map((e) => UserModel.fromJson(e)));
    } on DioException catch (e) {
      print(e.error);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('unexpected error  : $e');
      throw Exception('Failed to get users:$e');
    }
  }
}
