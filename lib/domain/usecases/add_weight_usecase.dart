import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/repos/weight_repo.dart';

import 'base_usecase.dart';

@injectable
class EditWeightUseCase implements BaseUseCase<AddWeightWeightUseCaseInput, void> {
  WeightRepo repo;
  EditWeightUseCase(this.repo);

  @override
  Future<Either<Failure, void>> execute(input) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
class AddWeightWeightUseCaseInput{
  DateTime dateTime;
  double weight;

  AddWeightWeightUseCaseInput(this.dateTime, this.weight);
}
