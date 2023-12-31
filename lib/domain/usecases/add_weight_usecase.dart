import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/repos/weight_repo.dart';

import 'base_usecase.dart';

@injectable
class AddWeightUseCase implements BaseAsyncUseCase<double, void> {
  final WeightRepo _repo;

  AddWeightUseCase(this._repo);

  @override
  Future<Either<Failure, void>> execute(weight) {
    return _repo.addWeight(weight);
  }
}
