import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/usecases/edit_weight_usecase.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';

@injectable
class EditWeightViewModel extends Cubit<BaseStates> {
  final EditWeightUseCase _editWeightUseCase;

  EditWeightViewModel(this._editWeightUseCase) : super(BaseInitialState());

  Future<void> editWeight(String id, double weight) async {
    Either<Failure, void> response = await _editWeightUseCase
        .execute(EditWeightUseCaseInput(id: id, weight: weight));
    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (_) => emit(BaseSuccessState()));
    return;
  }
}
