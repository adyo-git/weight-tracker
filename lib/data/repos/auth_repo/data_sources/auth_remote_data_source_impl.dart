import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/data/repos/auth_repo/data_sources/auth_remote_data_source.dart';
import '../../../../domain/models/failures.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{
  FirebaseAuth _authService;
  AuthRemoteDataSourceImpl(this._authService);

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