import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/repos/weight_repo.dart';

import 'base_usecase.dart';

@injectable
class DeleteWeightUseCase implements BaseAsyncUseCase<String, void> {
  final WeightRepo _repo;

  DeleteWeightUseCase(this._repo);

  @override
  Future<Either<Failure, void>> execute(id) {
    return _repo.deleteWeight(id);
  }
}
