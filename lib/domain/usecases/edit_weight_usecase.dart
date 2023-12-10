import 'package:dartz/dartz.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/repos/weight_repo.dart';

import 'base_usecase.dart';

class EditWeightUseCase implements BaseUseCase<String, void> {
  WeightRepo repo;
  EditWeightUseCase(this.repo);

  @override
  Future<Either<Failure, void>> execute(input) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}