import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/data/repos/auth_repo/data_sources/auth_remote_data_source.dart';
import 'package:weight_tracker/data/utils/firestore_extenions.dart';
import 'package:weight_tracker/domain/utils/constants.dart';

import '../../../../domain/models/failures.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth _authService;
  final FirestoreServices _firestoreServices;

  AuthRemoteDataSourceImpl(this._authService, this._firestoreServices);

  @override
  Future<Either<Failure, UserCredential>> signIn() async {
    try {
      final userCredential = await _authService.signInAnonymously();

      _firestoreServices.addUserFromCredential(userCredential.user!.uid,
          userCredential.user!.email ?? "", userCredential.user!.isAnonymous);

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("AuthRemoteDataSource.signIn- Exception: $e");
      }
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    return Right(_authService.signOut());
  }

  @override
  bool isUserSignedIn() {
    return _authService.currentUser == null;
  }
}
