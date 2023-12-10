import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/app_states.dart';
import 'package:weight_tracker/domain/models/no_params.dart';
import 'package:weight_tracker/domain/usecases/is_user_signed_in_usecase.dart';

@injectable
class AppCubit extends Cubit<AppStates> {
  final IsUserSignedInUseCase _getCurrentUserUseCase;

  AppCubit(this._getCurrentUserUseCase) : super(AppInitialState());

  bool get isCurrentUserSignedIn => _getCurrentUserUseCase.execute(NoParams());
}
