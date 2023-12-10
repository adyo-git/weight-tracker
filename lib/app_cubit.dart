import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/app_states.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/no_params.dart';
import 'package:weight_tracker/domain/usecases/is_user_signed_in_usecase.dart';

@injectable
class AppCubit extends Cubit<AppStates> {
  final IsUserSignedInUseCase _getCurrentUserUseCase;

  AppCubit(this._getCurrentUserUseCase) : super(AppInitialState());

  loadCurrentUser() async {
    Either<Failure, bool> response =
        await _getCurrentUserUseCase.execute(NoParams());
    response.fold((failure) => emit(AppInitialState()),
        (isSignedIn) => emit(AppUserLoadedState(isSignedIn)));
  }
}
