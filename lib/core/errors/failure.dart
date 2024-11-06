import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "connection timout with api server");

      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "send timout with api server");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "receive timout with api server");

      case DioExceptionType.badCertificate:
        return ServerFailure(message: "badCertificate timout with api server");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            error.response!.statusCode!, error.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure(message: "request to Api Server was canceld");

      case DioExceptionType.connectionError:
        return ServerFailure(message: "No Internet Connection");

      case DioExceptionType.unknown:
        return ServerFailure(message: "Something was wrong!");
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 404) {
      return ServerFailure(
          message: 'Your Api Server is not found , please try later');
    } else if (statuscode == 500) {
      return ServerFailure(
          message: 'there is a problem with server , please try later');
    } else if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      // return ServerFailure(message: response['error']['message']);
      return ServerFailure(message: "user not found");
    } else {
      return ServerFailure(message: 'there was an error , please try again');
    }
  }
}
