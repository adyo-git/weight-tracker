import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weight_tracker/data/repos/auth_repo/data_sources/auth_remote_data_source_impl.dart';
import 'package:weight_tracker/data/utils/firestore_extenions.dart';
import 'package:weight_tracker/domain/models/failures.dart';

import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateMocks(
    [FirebaseAuth, FirestoreServices, UserCredential, User])
void main() {
  MockFirebaseAuth? mockFirebaseAuth;
  MockFirestoreServices? mockFirestoreServices;
  AuthRemoteDataSourceImpl? dataSource;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirestoreServices = MockFirestoreServices();
    dataSource =
        AuthRemoteDataSourceImpl(mockFirebaseAuth!, mockFirestoreServices!);
  });

  group("sign in tests", () {
    test('signIn should return UserCredential on successful sign in', () async {
      final mockUserCredential = MockUserCredential();
      var mockedUser = MockUser();
      when(mockedUser.uid).thenAnswer((_) => "test id");
      when(mockedUser.email).thenAnswer((_) => "test@test.com");
      when(mockedUser.isAnonymous).thenAnswer((_) => true);
      when(mockUserCredential.user).thenAnswer((_) => mockedUser);

      when(mockFirebaseAuth!.signInAnonymously())
          .thenAnswer((_) async => mockUserCredential);
      when(mockFirestoreServices!.addUserFromCredential(
              mockedUser.uid, mockedUser.email ?? "", mockedUser.isAnonymous))
          .thenAnswer((_) async {});

      final result = await dataSource!.signIn();

      expect(result, isA<Right<Failure, UserCredential>>());
      expect(result.getOrElse(() => mockUserCredential),
          equals(mockUserCredential));
    });

    test('signIn should return Failure on FirebaseAuthException', () async {
      when(mockFirebaseAuth!.signInAnonymously())
          .thenThrow(FirebaseAuthException(code: "error"));
      final result = await dataSource!.signIn();

      expect(result, isA<Left<Failure, UserCredential>>());
    });
  });
}
