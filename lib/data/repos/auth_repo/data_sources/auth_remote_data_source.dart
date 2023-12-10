import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker/domain/models/app_user.dart';
import 'package:weight_tracker/domain/models/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, UserCredential>> signIn();

  Future<Either<Failure, void>> signOut();

  bool isUserSignedIn();
}
