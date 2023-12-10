import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/no_params.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/domain/usecases/delete_weight_usecase.dart';
import 'package:weight_tracker/domain/usecases/get_weights_stream_usecase.dart';
import 'package:weight_tracker/domain/usecases/sign_out_usecase.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';
import 'package:weight_tracker/presentation/screens/home/states.dart';

@injectable
class HomeViewModel extends Cubit {
  final GetWeightsStreamUseCase _streamUseCase;
  final DeleteWeightUseCase _deleteWeightUseCase;
  final SignOutUseCase _signOutUseCase;
  Stream<QuerySnapshot<Weight>>? _weightsStream;

  HomeViewModel(
      this._streamUseCase, this._deleteWeightUseCase, this._signOutUseCase)
      : super(BaseInitialState());

  Stream<QuerySnapshot<Weight>> get weightStream {
    if (_weightsStream == null) {
      _weightsStream = _streamUseCase.execute(NoParams());
      return _weightsStream!;
    } else {
      return _weightsStream!;
    }
  }

  Future<void> deleteWeight(String id) async {
    Either response = await _deleteWeightUseCase.execute(id);
    response.fold(
        (failure) =>
            emit(BaseErrorState("Something went wrong while deleting weight")),
        (_) => null);
  }

  Future<void> signOut() async {
    Either response = await _signOutUseCase.execute(NoParams());
    response.fold(
        (failure) =>
            emit(BaseErrorState("Something went wrong while signing out.")),
        (_) => emit(UserSignedOutState()));
  }
}
