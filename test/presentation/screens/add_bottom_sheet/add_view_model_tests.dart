import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/usecases/add_weight_usecase.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';
import 'package:weight_tracker/presentation/screens/add_bottom_sheet/add_view_model.dart';

import 'add_view_model_tests.mocks.dart';

@GenerateMocks([AddWeightUseCase])
void main() {
  MockAddWeightUseCase? mockAddWeightUseCase;
  AddWeightViewModel? viewModel;

  setUp(() {
    mockAddWeightUseCase = MockAddWeightUseCase();
    viewModel = AddWeightViewModel(mockAddWeightUseCase!);
  });

  test('addWeight should emit BaseSuccessState on successful addition',
      () async {
    when(mockAddWeightUseCase!.execute(any))
        .thenAnswer((_) async => const Right(null));

    await viewModel!.addWeight(70.0);

    expect(viewModel!.state, isA<BaseSuccessState>());
  });

  test('addWeight should emit BaseErrorState on failure', () async {
    final mockFailure = Failure("Error adding weight");
    when(mockAddWeightUseCase!.execute(any))
        .thenAnswer((_) async => Left(mockFailure));

    await viewModel!.addWeight(70.0);

    expect(viewModel!.state, isA<BaseErrorState>());
    expect((viewModel!.state as BaseErrorState).errorMessage,
        equals("Error adding weight"));
  });
}
