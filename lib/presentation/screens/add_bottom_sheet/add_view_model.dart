import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/usecases/add_weight_usecase.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';

@injectable
class AddWeightViewModel extends Cubit<BaseStates> {
  final AddWeightUseCase _addWeightUseCase;

  AddWeightViewModel(this._addWeightUseCase) : super(BaseInitialState());

  Future<void> addWeight(double weight) async {
    Either<Failure, void> response = await _addWeightUseCase.execute(weight);
    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (_) => emit(BaseSuccessState()));
    return;
  }
}
