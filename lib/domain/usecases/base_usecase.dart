import 'package:dartz/dartz.dart';
import 'package:weight_tracker/domain/models/failures.dart';

abstract class BaseAsyncUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
abstract class BaseNonAsyncUseCase<In, Out> {
  Out execute(In input);
}

