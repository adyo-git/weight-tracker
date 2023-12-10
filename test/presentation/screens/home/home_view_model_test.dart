import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weight_tracker/domain/models/failures.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/domain/usecases/delete_weight_usecase.dart';
import 'package:weight_tracker/domain/usecases/get_weights_stream_usecase.dart';
import 'package:weight_tracker/domain/usecases/sign_out_usecase.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';
import 'package:weight_tracker/presentation/screens/home/home_view_model.dart';
import 'package:weight_tracker/presentation/screens/home/states.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([GetWeightsStreamUseCase, DeleteWeightUseCase, SignOutUseCase])
void main() {
  MockGetWeightsStreamUseCase? mockGetWeightsStreamUseCase;
  MockDeleteWeightUseCase? mockDeleteWeightUseCase;
  MockSignOutUseCase? mockSignOutUseCase;
  HomeViewModel? viewModel;

  setUp(() {
    mockGetWeightsStreamUseCase = MockGetWeightsStreamUseCase();
    mockDeleteWeightUseCase = MockDeleteWeightUseCase();
    mockSignOutUseCase = MockSignOutUseCase();
    viewModel = HomeViewModel(
        mockGetWeightsStreamUseCase!,
        mockDeleteWeightUseCase!,
        mockSignOutUseCase!);
  });

  group("Weight stream tests", () {
    test('weightStream should return a valid stream', () {
      const mockStream = Stream<QuerySnapshot<Weight>>.empty();
      when(mockGetWeightsStreamUseCase!.execute(any))
          .thenAnswer((_) => mockStream);

      expect(viewModel!.weightStream, equals(mockStream));
    });

    test('weightStream should not create a new stream if already exists', () {
      const mockStream = Stream<QuerySnapshot<Weight>>.empty();
      when(mockGetWeightsStreamUseCase!.execute(any))
          .thenAnswer((_) => mockStream);

      final firstCall = viewModel!.weightStream;
      final secondCall = viewModel!.weightStream;

      expect(identical(firstCall, secondCall), isTrue);
    });
  });
  
  group("deleteWeight tests", () {
    test('deleteWeight should emit no error state on successful deletion', () async {
      when(mockDeleteWeightUseCase!.execute(any))
          .thenAnswer((_) async => const Right(null));

      await viewModel!.deleteWeight('testId');

      expect(viewModel!.state, isNot(isA<BaseErrorState>()));
    });

    test('deleteWeight should emit BaseErrorState on failure', () async {
      when(mockDeleteWeightUseCase!.execute(any))
          .thenAnswer((_) async => Left(Failure('Error')));

      await viewModel!.deleteWeight('testId');

      expect(viewModel!.state, isA<BaseErrorState>());
    });
  });

  group("signOut tests", () {
    test('signOut should emit UserSignedOutState on successful sign out',
        () async {
      when(mockSignOutUseCase!.execute(any))
          .thenAnswer((_) async => const Right(null));

      await viewModel!.signOut();

      expect(viewModel!.state, isA<UserSignedOutState>());
    });

    test('signOut should emit BaseErrorState on failure', () async {
      when(mockSignOutUseCase!.execute(any))
          .thenAnswer((_) async => Left(Failure('Error')));

      await viewModel!.signOut();

      expect(viewModel!.state, isA<BaseErrorState>());
    });
  });
}