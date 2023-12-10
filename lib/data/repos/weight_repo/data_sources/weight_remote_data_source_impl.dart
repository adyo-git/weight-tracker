import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/data/repos/weight_repo/data_sources/weight_remote_data_source.dart';
import 'package:weight_tracker/data/utils/firestore_extenions.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/domain/utils/constants.dart';

@Injectable(as: WeightRemoteDataSource)
class WeightRemoteDataSourceImpl extends WeightRemoteDataSource {
  final FirebaseAuth _authService;
  final FirestoreServices _firestoreServices;

  WeightRemoteDataSourceImpl(this._authService, this._firestoreServices);

  @override
  Future<Either<Failure, void>> editWeight(String id, double weight) async {
    try {
      var uid = _authService.currentUser!.uid;
      var doc = _firestoreServices.getUserWeightsCollection(uid).doc(id);
      return Right(await doc.update({"weight": weight}));
    } catch (_) {
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }

  @override
  Stream<QuerySnapshot<Weight>> getWeightStream() {
    var uid = _authService.currentUser!.uid;
    var weightsCollection = _firestoreServices.getUserWeightsCollection(uid);
    return weightsCollection.orderBy("date").snapshots();
  }

  @override
  Future<Either<Failure, void>> addWeight(double weight) async {
    try {
      var uid = _authService.currentUser!.uid;
      var doc = _firestoreServices.getUserWeightsCollection(uid).doc();
      var docData = Weight(id: doc.id, weight: weight, date: DateTime.now());
      return Right(await doc.set(docData));
    } catch (_) {
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteWeight(String id) async {
    try {
      var uid = _authService.currentUser!.uid;
      var doc = _firestoreServices.getUserWeightsCollection(uid).doc(id);
      return Right(await doc.delete());
    } catch (_) {
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }
}
