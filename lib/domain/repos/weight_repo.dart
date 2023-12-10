import 'package:dartz/dartz.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/weight.dart';

abstract class WeightRepo {
  Future<Stream<Weight>> getWeightStream();
  Future<Either<Failure, void>> editWeight(String id);
  Future<Either<Failure, void>> addWeight(DateTime date, double weight);
}
