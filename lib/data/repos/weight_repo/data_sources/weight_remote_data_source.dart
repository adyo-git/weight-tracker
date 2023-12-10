import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/weight.dart';

abstract class WeightRemoteDataSource {
  Stream<QuerySnapshot<Weight>> getWeightStream();

  Future<Either<Failure, void>> editWeight(String id, double weight);

  Future<Either<Failure, void>> addWeight(double weight);

  Future<Either<Failure, void>> deleteWeight(String id);
}
