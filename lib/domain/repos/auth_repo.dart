import 'package:dartz/dartz.dart';
import 'package:weight_tracker/domain/models/app_user.dart';
import 'package:weight_tracker/domain/models/failures.dart';

abstract class AuthRepo{
   Future<Either<Failure, void>> anonymousSignIn();

   Future<Either<Failure, void>> signOut();

   bool isUserSignedIn();
}