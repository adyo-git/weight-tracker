import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weight_tracker/data/repos/weight_repo/data_sources/weight_remote_data_source.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/domain/repos/weight_repo.dart';

import '../../../domain/utils/constants.dart';

@Injectable(as: WeightRepo)
class WeightRepoImpl extends WeightRepo {
  final InternetConnectionChecker _connectionChecker;
  final WeightRemoteDataSource _remoteDataSource;

  WeightRepoImpl(this._connectionChecker, this._remoteDataSource);

  @override
  Future<Either<Failure, void>> editWeight(String id, double weight) async {
    if (await _connectionChecker.hasConnection) {
      return _remoteDataSource.editWeight(id, weight);
    } else {
      return Left(NetworkFailure(Constants.defaultNetworkErrorMessage));
    }
  }

  @override
  Stream<QuerySnapshot<Weight>> getWeightStream() {
    return _remoteDataSource.getWeightStream();
  }

  @override
  Future<Either<Failure, void>> addWeight(double weight) async {
    if (await _connectionChecker.hasConnection) {
      return _remoteDataSource.addWeight(weight);
    } else {
      return Left(NetworkFailure(Constants.defaultNetworkErrorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteWeight(String id) async {
    if (await _connectionChecker.hasConnection) {
      return _remoteDataSource.deleteWeight(id);
    } else {
      return Left(NetworkFailure(Constants.defaultNetworkErrorMessage));
    }
  }
}
