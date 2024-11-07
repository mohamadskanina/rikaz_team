import 'package:equatable/equatable.dart';

class FailureTest extends Equatable {
  const FailureTest({required this.message, required this.statusCode});

  final String message;
  final int statusCode;
 

  @override
  List<Object?> get props => [message];
}

class ServerFailureTest extends FailureTest {
  const ServerFailureTest({required super.statusCode, required super.message});
}