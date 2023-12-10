import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/no_params.dart';
import 'package:weight_tracker/domain/repos/auth_repo.dart';
import 'package:weight_tracker/domain/usecases/base_usecase.dart';

@injectable
class IsUserSignedInUseCase implements BaseAsyncUseCase<NoParams, bool> {
  final AuthRepo _authRepo;

  IsUserSignedInUseCase(this._authRepo);

  @override
  Future<Either<Failure, bool>> execute(input) async {
    return Future.value(Right(_authRepo.isUserSignedIn()));
  }
}
