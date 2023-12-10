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
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../app_cubit.dart' as _i21;
import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i14;
import '../../data/repos/auth_repo/data_sources/auth_remote_data_source.dart'
    as _i11;
import '../../data/repos/auth_repo/data_sources/auth_remote_data_source_impl.dart'
    as _i12;
import '../../data/repos/weight_repo/data_sources/weight_remote_data_source.dart'
    as _i7;
import '../../data/repos/weight_repo/data_sources/weight_remote_data_source_impl.dart'
    as _i8;
import '../../data/repos/weight_repo/weight_repo_impl.dart' as _i10;
import '../../presentation/screens/sign_in/sign_in_view_model.dart' as _i22;
import '../repos/auth_repo.dart' as _i13;
import '../repos/weight_repo.dart' as _i9;
import '../usecases/add_weight_usecase.dart' as _i15;
import '../usecases/anonymous_sign_in_usecase.dart' as _i20;
import '../usecases/edit_weight_usecase.dart' as _i16;
import '../usecases/get_current_user_usecase.dart' as _i18;
import '../usecases/get_weights_stream_usecase.dart' as _i17;
import '../usecases/sign_out_usecase.dart' as _i19;
import 'modules/di_module.dart' as _i24;
import 'modules/fb_module.dart' as _i23;

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
    gh.factoryAsync<_i6.SharedPreferences>(() => dIModule.prefs);
    gh.factory<_i7.WeightRemoteDataSource>(
        () => _i8.WeightRemoteDataSourceImpl(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i9.WeightRepo>(() => _i10.WeightRepoImpl(
          gh<_i5.InternetConnectionChecker>(),
          gh<_i7.WeightRemoteDataSource>(),
        ));
    gh.factory<_i11.AuthRemoteDataSource>(() => _i12.AuthRemoteDataSourceImpl(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i13.AuthRepo>(() => _i14.AuthRepoImpl(
          gh<_i5.InternetConnectionChecker>(),
          gh<_i11.AuthRemoteDataSource>(),
        ));
    gh.factory<_i15.EditWeightUseCase>(
        () => _i15.EditWeightUseCase(gh<_i9.WeightRepo>()));
    gh.factory<_i16.EditWeightUseCase>(
        () => _i16.EditWeightUseCase(gh<_i9.WeightRepo>()));
    gh.factory<_i17.GetWeightsStreamUseCase>(
        () => _i17.GetWeightsStreamUseCase(gh<_i9.WeightRepo>()));
    gh.factory<_i18.IsUserSignedInUseCase>(
        () => _i18.IsUserSignedInUseCase(gh<_i13.AuthRepo>()));
    gh.factory<_i19.SignOutUseCase>(
        () => _i19.SignOutUseCase(gh<_i13.AuthRepo>()));
    gh.factory<_i20.AnonymousSignInUseCase>(
        () => _i20.AnonymousSignInUseCase(gh<_i13.AuthRepo>()));
    gh.factory<_i21.AppCubit>(
        () => _i21.AppCubit(gh<_i18.IsUserSignedInUseCase>()));
    gh.factory<_i22.SignInViewModel>(
        () => _i22.SignInViewModel(gh<_i20.AnonymousSignInUseCase>()));
    return this;
  }
}

class _$FbModule extends _i23.FbModule {}

class _$DIModule extends _i24.DIModule {}
