import 'package:rikaz_team/core/utils/failure_message_model.dart';


class ServerException implements Exception {
  final int? statusCode;
  final ErrorMessageModel errorMessageModel;

  const ServerException(
      {required this.statusCode, required this.errorMessageModel});
}