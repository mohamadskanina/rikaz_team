import '../network/error_message.dart';

class ServerException implements Exception {
  final int? statusCode;
  final ErrorMessageModel errorMessageModel;

  const ServerException(
      {required this.statusCode, required this.errorMessageModel});
}
