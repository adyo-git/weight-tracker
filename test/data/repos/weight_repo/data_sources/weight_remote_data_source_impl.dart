import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weight_tracker/data/repos/weight_repo/data_sources/weight_remote_data_source_impl.dart';
import 'package:weight_tracker/data/utils/firestore_extenions.dart';
import 'package:weight_tracker/domain/models/app_user.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/weight.dart';

import 'weight_remote_data_source_impl.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
  FirestoreServices,
  UserCredential,
  User,
  CollectionReference,
  DocumentReference,
  QuerySnapshot
])
void main() {
  MockFirebaseAuth? mockFirebaseAuth;
  MockFirestoreServices? mockFirestoreServices;
  WeightRemoteDataSourceImpl? dataSource;
  final mockUserCredential = MockUserCredential();
  var mockedUser = MockUser();
  var mockWeightCollectionReference = MockCollectionReference<Weight>();
  var mockUserCollectionReference = MockCollectionReference<AppUser>();
  var mockDocumentReference = MockDocumentReference<Weight>();

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirestoreServices = MockFirestoreServices();
    dataSource =
        WeightRemoteDataSourceImpl(mockFirebaseAuth!, mockFirestoreServices!);

    when(mockedUser.uid).thenAnswer((_) => "test id");
    when(mockUserCredential.user).thenAnswer((_) => mockedUser);
    when(mockFirebaseAuth!.currentUser).thenAnswer((_) => mockedUser);
    when(mockFirestoreServices!.userCollection)
        .thenAnswer((_) => mockUserCollectionReference);
    when(mockFirestoreServices!.getUserWeightsCollection(any))
        .thenAnswer((_) => mockWeightCollectionReference);
    when(mockDocumentReference.id).thenAnswer((_) => "id");
    when(mockWeightCollectionReference.doc(any))
        .thenReturn(mockDocumentReference);
  });

  group("editWeight tests", () {
    test('editWeight should return Right on successful edit', () async {
      const id = 'testWeightId';
      const weight = 75.0;

      when(mockDocumentReference.update({"weight": weight}))
          .thenAnswer((_) async {});

      final result = await dataSource!.editWeight(id, weight);

      expect(result, isA<Right<Failure, void>>());
    });

    test('editWeight should return Left on error', () async {
      const id = 'testWeightId';
      const weight = 75.0;

      when(mockDocumentReference.update({"weight": weight}))
          .thenThrow(Exception());

      final result = await dataSource!.editWeight(id, weight);

      expect(result, isA<Left<Failure, void>>());
    });
  });

  group("addWeight tests", () {
    test('addWeight should return Right on successful addition', () async {
      const weight = 75.0;

      when(mockDocumentReference.set(any)).thenAnswer((_) async {});

      final result = await dataSource!.addWeight(weight);

      expect(result, isA<Right<Failure, void>>());
    });

    test('addWeight should return Left on error', () async {
      const weight = 75.0;

      when(mockDocumentReference.set(any)).thenThrow(Exception());

      final result = await dataSource!.addWeight(weight);

      expect(result, isA<Left<Failure, void>>());
    });
  });

  group("deleteWeight tests", () {
    test('deleteWeight should return Right on successful deletion', () async {
      const id = 'testWeightId';

      when(mockDocumentReference.delete()).thenAnswer((_) async {});

      final result = await dataSource!.deleteWeight(id);

      expect(result, isA<Right<Failure, void>>());
    });

    test('deleteWeight should return Left on error', () async {
      const id = 'testWeightId';

      when(mockDocumentReference.delete()).thenThrow(Exception());

      final result = await dataSource!.deleteWeight(id);

      expect(result, isA<Left<Failure, void>>());
    });
  });

  group("getWeightStream tests", () {
    test('getWeightStream should return a Stream', () {
      final mockQuerySnapshot = MockQuerySnapshot<Weight>();

      when(mockWeightCollectionReference.orderBy("date"))
          .thenReturn(mockWeightCollectionReference);
      when(mockWeightCollectionReference.snapshots())
          .thenAnswer((_) => Stream.value(mockQuerySnapshot));

      final result = dataSource!.getWeightStream();

      expect(result, isA<Stream<QuerySnapshot<Weight>>>());
    });
  });
}
