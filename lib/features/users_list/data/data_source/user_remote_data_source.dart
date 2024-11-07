import 'dart:convert';

import 'package:rikaz_team/features/users_list/data/model/user_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_constances.dart';
import '../../../../core/network/error_message.dart';
import '../../domain/entities/user.dart';

abstract class BaseUserRemoteDataSource {
  Future<List<UserModel>> getUsersList();
  Future<void> updateUserInfo({required User user});
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
      print(e.error);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('unexpected error  : $e');
      throw Exception('Failed to get users:$e');
    }
  }

  @override
  Future<void> updateUserInfo({required User user}) async {
    try {
      await Dio().patch(ApiConstances.updateUserUrl(user.id),
          data: const JsonEncoder().convert({
            'email': user.email,
            'first_name': user.first_name,
            'last_name': user.last_name,
          }));
    } on DioException catch (e) {
      print(e);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
          statusCode: e.response?.statusCode);
    } catch (e) {
      print('unexpected error  : $e');
      throw Exception('Failed to update user info:$e');
    }
  }
}
