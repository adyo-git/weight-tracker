import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/no_params.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/domain/repos/weight_repo.dart';

import 'base_usecase.dart';

@injectable
class GetWeightsStreamUseCase
    implements BaseNonAsyncUseCase<NoParams, Stream<QuerySnapshot<Weight>>> {
  final WeightRepo _repo;

  GetWeightsStreamUseCase(this._repo);

  @override
  Stream<QuerySnapshot<Weight>> execute(input) {
    return _repo.getWeightStream();
  }
}
