import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/no_params.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/domain/usecases/delete_weight_usecase.dart';
import 'package:weight_tracker/domain/usecases/edit_weight_usecase.dart';
import 'package:weight_tracker/domain/usecases/get_weights_stream_usecase.dart';

@injectable
class HomeViewModel extends Cubit {
  final GetWeightsStreamUseCase _streamUseCase;
  final EditWeightUseCase _editWeightUseCase;
  final DeleteWeightUseCase _deleteWeightUseCase;
  Stream<QuerySnapshot<Weight>>? _weightsStream;

  HomeViewModel(
      this._streamUseCase, this._editWeightUseCase, this._deleteWeightUseCase)
      : super(0);

  Stream<QuerySnapshot<Weight>> get weightStream {
    if (_weightsStream == null) {
      _weightsStream = _streamUseCase.execute(NoParams());
      return _weightsStream!;
    } else {
      return _weightsStream!;
    }
  }
}
