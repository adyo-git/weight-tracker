import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/usecases/anonymous_sign_in_usecase.dart';
import 'package:weight_tracker/domain/utils/constants.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';
import 'package:weight_tracker/presentation/screens/sign_in/sign_in_view_model.dart';

import 'sign_in_view_model_test.mocks.dart';

@GenerateMocks([AnonymousSignInUseCase])
void main() {
  MockAnonymousSignInUseCase? mockAnonymousSignInUseCase;
  SignInViewModel? viewModel;

  setUp(() {
    mockAnonymousSignInUseCase = MockAnonymousSignInUseCase();
    viewModel = SignInViewModel(mockAnonymousSignInUseCase!);
  });
  test(
      'should emit [BaseLoadingState, BaseSuccessState] when signIn is successful',
      () async {
    when(mockAnonymousSignInUseCase!.execute(any))
        .thenAnswer((_) async => const Right(null));

    var emittedStates = <BaseStates>[];
    var subscription = viewModel!.stream.listen((state) {
      emittedStates.add(state);
    });

    await viewModel!.signIn();

    ///First state is loading
    expect(emittedStates[0], isA<BaseLoadingState>());

    /// current state is success
    expect(viewModel!.state, isA<BaseSuccessState>());

    subscription.cancel();
  });

  test('should emit [BaseLoadingState, BaseErrorState] when signIn fails',
      () async {
    final mockFailure = Failure(Constants.defaultErrorMessage);
    when(mockAnonymousSignInUseCase!.execute(any))
        .thenAnswer((_) async => Left(mockFailure));

    var emittedStates = <BaseStates>[];
    var subscription = viewModel!.stream.listen((state) {
      emittedStates.add(state);
    });

    ///This call should first emit loading then error states
    await viewModel!.signIn();

    ///First state is loading
    expect(emittedStates[0], isA<BaseLoadingState>());

    /// current state is error
    expect(viewModel!.state, isA<BaseErrorState>());
    expect((viewModel!.state as BaseErrorState).errorMessage,
        mockFailure.errorMessage);
    subscription.cancel();
  });
}
