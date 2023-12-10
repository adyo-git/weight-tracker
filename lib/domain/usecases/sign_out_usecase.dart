import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/repos/auth_repo.dart';
import 'package:weight_tracker/domain/usecases/base_usecase.dart';

@injectable
class SignOutUseCase implements BaseUseCase {
  AuthRepo authRepo;

  SignOutUseCase(this.authRepo);

  @override
  Future<Either<Failure, dynamic>> execute(input) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
