import 'package:dartz/dartz.dart';

import 'failure_test.dart';


typedef ResultFuture<T> = Future<Either<FailureTest, T>>;

typedef ResultVoid = ResultFuture<void>;