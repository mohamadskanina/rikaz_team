import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String message;

  const ErrorMessageModel(
      {required this.statusCode ,required this.message });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        statusCode: json["status"] ?? 500,
        message: json["title"] ?? "",
        );
  }

  @override
  List<Object?> get props => [statusCode, message];
}
