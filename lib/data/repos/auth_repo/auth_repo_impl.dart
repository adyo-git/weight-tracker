import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weight_tracker/data/repos/auth_repo/data_sources/auth_remote_data_source.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/repos/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  InternetConnectionChecker connectionChecker;
  AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl(this.connectionChecker, this.remoteDataSource);

  @override
  Future<Either<Failure, void>> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
