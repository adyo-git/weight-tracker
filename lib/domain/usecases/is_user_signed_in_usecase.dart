import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/no_params.dart';
import 'package:weight_tracker/domain/repos/auth_repo.dart';
import 'package:weight_tracker/domain/usecases/base_usecase.dart';

@injectable
class IsUserSignedInUseCase implements BaseNonAsyncUseCase<NoParams, bool> {
  final AuthRepo _authRepo;

  IsUserSignedInUseCase(this._authRepo);

  @override
  bool execute(input) {
    return _authRepo.isUserSignedIn();
  }
}
