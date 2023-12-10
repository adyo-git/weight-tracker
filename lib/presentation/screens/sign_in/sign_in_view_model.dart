import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/no_params.dart';
import 'package:weight_tracker/domain/usecases/anonymous_sign_in_usecase.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';

@injectable
class SignInViewModel extends Cubit<BaseStates> {
  final AnonymousSignInUseCase _anonymousSignInUseCase;

  SignInViewModel(this._anonymousSignInUseCase) : super(BaseInitialState());

  Future<void> signIn() async {
    emit(BaseLoadingState());
    Either<Failure, void> response =
        await _anonymousSignInUseCase.execute(NoParams());
    response.fold(
        (failure) => emit(
            BaseErrorState(failure.errorMessage, failure is NetworkFailure)),
        (_) {
      emit(BaseSuccessState());
    });
  }
}
