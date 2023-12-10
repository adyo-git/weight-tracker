import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/usecases/edit_weight_usecase.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';
import 'package:weight_tracker/presentation/screens/edit_weight_bottom_sheet/edit_weight_view_model.dart';

import 'edit_weight_view_model.mocks.dart';

@GenerateMocks([EditWeightUseCase])
void main() {
  MockEditWeightUseCase? mockEditWeightUseCase;
  EditWeightViewModel? viewModel;

  setUp(() {
    mockEditWeightUseCase = MockEditWeightUseCase();
    viewModel = EditWeightViewModel(mockEditWeightUseCase!);
  });

  test('editWeight should emit BaseSuccessState on successful edit', () async {
    when(mockEditWeightUseCase!.execute(any))
        .thenAnswer((_) async => Right(null));

    await viewModel!.editWeight('testId', 75.0);

    expect(viewModel!.state, isA<BaseSuccessState>());
  });

  test('editWeight should emit BaseErrorState on failure', () async {
    final mockFailure = Failure("Error editing weight");
    when(mockEditWeightUseCase!.execute(any))
        .thenAnswer((_) async => Left(mockFailure));

    await viewModel!.editWeight('testId', 75.0);

    expect(viewModel!.state, isA<BaseErrorState>());
    expect((viewModel!.state as BaseErrorState).errorMessage,
        equals("Error editing weight"));
  });
}
