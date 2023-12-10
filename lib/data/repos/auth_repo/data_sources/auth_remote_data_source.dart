import 'package:dartz/dartz.dart';
import 'package:weight_tracker/domain/models/failures.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failure, void>> signIn();

  Future<Either<Failure, void>> signOut();
}