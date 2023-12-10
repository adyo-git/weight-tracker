import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weight_tracker/data/repos/weight_repo/data_sources/weight_remote_data_source.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/domain/repos/weight_repo.dart';

//@Injectable(as: WeightRepo)
class WeightRepoImpl extends WeightRepo {
  InternetConnectionChecker connectionChecker;
  WeightRemoteDataSource remoteDataSource;

  WeightRepoImpl(this.connectionChecker, this.remoteDataSource);

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
