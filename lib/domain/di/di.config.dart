// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i13;
import '../../data/repos/auth_repo/data_sources/auth_remote_data_source.dart'
    as _i10;
import '../../data/repos/auth_repo/data_sources/auth_remote_data_source_impl.dart'
    as _i11;
import '../../data/repos/weight_repo/data_sources/weight_remote_data_source.dart'
    as _i6;
import '../../data/repos/weight_repo/data_sources/weight_remote_data_source_impl.dart'
    as _i7;
import '../../data/repos/weight_repo/weight_repo_impl.dart' as _i9;
import '../repos/auth_repo.dart' as _i12;
import '../repos/weight_repo.dart' as _i8;
import '../usecases/add_weight_usecase.dart' as _i14;
import '../usecases/anonymous_sign_in_usecase.dart' as _i18;
import '../usecases/edit_weight_usecase.dart' as _i15;
import '../usecases/get_weights_stream_usecase.dart' as _i16;
import '../usecases/sign_out_usecase.dart' as _i17;
import 'modules/di_module.dart' as _i20;
import 'modules/fb_module.dart' as _i19;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final fbModule = _$FbModule();
    final dIModule = _$DIModule();
    gh.factory<_i3.FirebaseAuth>(() => fbModule.auth);
    gh.factory<_i4.FirebaseFirestore>(() => fbModule.firestore);
    gh.factory<_i5.InternetConnectionChecker>(() => dIModule.connectionChecker);
    gh.factory<_i6.WeightRemoteDataSource>(
        () => _i7.WeightRemoteDataSourceImpl(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i8.WeightRepo>(() => _i9.WeightRepoImpl(
          gh<_i5.InternetConnectionChecker>(),
          gh<_i6.WeightRemoteDataSource>(),
        ));
    gh.factory<_i10.AuthRemoteDataSource>(
        () => _i11.AuthRemoteDataSourceImpl(gh<_i3.FirebaseAuth>()));
    gh.factory<_i12.AuthRepo>(() => _i13.AuthRepoImpl(
          gh<_i5.InternetConnectionChecker>(),
          gh<_i10.AuthRemoteDataSource>(),
        ));
    gh.factory<_i14.EditWeightUseCase>(
        () => _i14.EditWeightUseCase(gh<_i8.WeightRepo>()));
    gh.factory<_i15.EditWeightUseCase>(
        () => _i15.EditWeightUseCase(gh<_i8.WeightRepo>()));
    gh.factory<_i16.GetWeightsStreamUseCase>(
        () => _i16.GetWeightsStreamUseCase(gh<_i8.WeightRepo>()));
    gh.factory<_i17.SignOutUseCase>(
        () => _i17.SignOutUseCase(gh<_i12.AuthRepo>()));
    gh.factory<_i18.AnonymousSignInUseCase>(
        () => _i18.AnonymousSignInUseCase(gh<_i12.AuthRepo>()));
    return this;
  }
}

class _$FbModule extends _i19.FbModule {}

class _$DIModule extends _i20.DIModule {}
