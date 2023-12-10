import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/data/repos/weight_repo/data_sources/weight_remote_data_source.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/weight.dart';

@Injectable(as: WeightRemoteDataSource)
class WeightRemoteDataSourceImpl extends WeightRemoteDataSource{
  FirebaseFirestore _firestore;
  WeightRemoteDataSourceImpl(this._firestore);

  @override
  Future<Either<Failure, void>> editWeight(String id) {
    // TODO: implement editWeight
    throw UnimplementedError();
  }

  @override
  Future<Stream<Weight>> getWeightStream() {
    // TODO: implement getWeightStream
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addWeight(DateTime date, double weight) {
    // TODO: implement addWeight
    throw UnimplementedError();
  }
}
