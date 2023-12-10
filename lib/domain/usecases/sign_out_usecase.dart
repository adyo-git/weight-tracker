import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/no_params.dart';
import 'package:weight_tracker/domain/repos/auth_repo.dart';
import 'package:weight_tracker/domain/usecases/base_usecase.dart';

@injectable
class SignOutUseCase implements BaseAsyncUseCase<NoParams, void> {
  final AuthRepo _authRepo;

  SignOutUseCase(this._authRepo);

  @override
  Future<Either<Failure, dynamic>> execute(input) {
    return _authRepo.signOut();
  }
}
