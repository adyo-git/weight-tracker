import 'package:dartz/dartz.dart';
import 'package:weight_tracker/domain/models/failures.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

