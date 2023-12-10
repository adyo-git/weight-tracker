import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/repos/weight_repo.dart';

import 'base_usecase.dart';

@injectable
class EditWeightUseCase implements BaseAsyncUseCase<EditWeightUseCaseInput, void> {
  final WeightRepo _repo;

  EditWeightUseCase(this._repo);

  @override
  Future<Either<Failure, void>> execute(input) {
    return _repo.editWeight(input.id, input.weight);
  }
}

class EditWeightUseCaseInput {
  String id;
  double weight;

  EditWeightUseCaseInput({required this.id, required this.weight});
}
