import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weight_tracker/data/repos/auth_repo/data_sources/auth_remote_data_source.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/repos/auth_repo.dart';
import 'package:weight_tracker/domain/utils/constants.dart';

import '../../../domain/models/app_user.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final InternetConnectionChecker _connectionChecker;
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._connectionChecker, this._remoteDataSource);

  @override
  Future<Either<Failure, void>> anonymousSignIn() async {
    if (await _connectionChecker.hasConnection) {
      return _remoteDataSource.signIn();
    } else {
      return Left(NetworkFailure(Constants.defaultNetworkErrorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  bool isUserSignedIn() {
    return _remoteDataSource.isUserSignedIn();
  }
}
