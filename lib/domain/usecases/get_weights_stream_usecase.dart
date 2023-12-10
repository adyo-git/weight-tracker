import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/domain/repos/weight_repo.dart';

import 'base_usecase.dart';

@injectable
class GetWeightsStreamUseCase implements BaseUseCase<void, Stream<Weight>> {
  WeightRepo repo;
  GetWeightsStreamUseCase(this.repo);

  @override
  Future<Either<Failure, Stream<Weight>>> execute(input) {
    throw UnimplementedError();
  }
}
