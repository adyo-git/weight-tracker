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

import '../../app_cubit.dart' as _i24;
import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i16;
import '../../data/repos/auth_repo/data_sources/auth_remote_data_source.dart'
    as _i13;
import '../../data/repos/auth_repo/data_sources/auth_remote_data_source_impl.dart'
    as _i14;
import '../../data/repos/weight_repo/data_sources/weight_remote_data_source.dart'
    as _i7;
import '../../data/repos/weight_repo/data_sources/weight_remote_data_source_impl.dart'
    as _i8;
import '../../data/repos/weight_repo/weight_repo_impl.dart' as _i10;
import '../../presentation/screens/add_bottom_sheet/add_view_model.dart'
    as _i12;
import '../../presentation/screens/home/home_view_model.dart' as _i20;
import '../../presentation/screens/sign_in/sign_in_view_model.dart' as _i25;
import '../repos/auth_repo.dart' as _i15;
import '../repos/weight_repo.dart' as _i9;
import '../usecases/add_weight_usecase.dart' as _i11;
import '../usecases/anonymous_sign_in_usecase.dart' as _i23;
import '../usecases/delete_weight_usecase.dart' as _i17;
import '../usecases/edit_weight_usecase.dart' as _i18;
import '../usecases/get_weights_stream_usecase.dart' as _i19;
import '../usecases/is_user_signed_in_usecase.dart' as _i21;
import '../usecases/sign_out_usecase.dart' as _i22;
import 'modules/di_module.dart' as _i27;
import 'modules/fb_module.dart' as _i26;

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
    gh.factory<_i7.WeightRemoteDataSource>(() => _i8.WeightRemoteDataSourceImpl(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i9.WeightRepo>(() => _i10.WeightRepoImpl(
          gh<_i5.InternetConnectionChecker>(),
          gh<_i7.WeightRemoteDataSource>(),
        ));
    gh.factory<_i11.AddWeightUseCase>(
        () => _i11.AddWeightUseCase(gh<_i9.WeightRepo>()));
    gh.factory<_i12.AddWeightViewModel>(
        () => _i12.AddWeightViewModel(gh<_i11.AddWeightUseCase>()));
    gh.factory<_i13.AuthRemoteDataSource>(() => _i14.AuthRemoteDataSourceImpl(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i15.AuthRepo>(() => _i16.AuthRepoImpl(
          gh<_i5.InternetConnectionChecker>(),
          gh<_i13.AuthRemoteDataSource>(),
        ));
    gh.factory<_i17.DeleteWeightUseCase>(
        () => _i17.DeleteWeightUseCase(gh<_i9.WeightRepo>()));
    gh.factory<_i18.EditWeightUseCase>(
        () => _i18.EditWeightUseCase(gh<_i9.WeightRepo>()));
    gh.factory<_i19.GetWeightsStreamUseCase>(
        () => _i19.GetWeightsStreamUseCase(gh<_i9.WeightRepo>()));
    gh.factory<_i20.HomeViewModel>(() => _i20.HomeViewModel(
          gh<_i19.GetWeightsStreamUseCase>(),
          gh<_i18.EditWeightUseCase>(),
          gh<_i17.DeleteWeightUseCase>(),
        ));
    gh.factory<_i21.IsUserSignedInUseCase>(
        () => _i21.IsUserSignedInUseCase(gh<_i15.AuthRepo>()));
    gh.factory<_i22.SignOutUseCase>(
        () => _i22.SignOutUseCase(gh<_i15.AuthRepo>()));
    gh.factory<_i23.AnonymousSignInUseCase>(
        () => _i23.AnonymousSignInUseCase(gh<_i15.AuthRepo>()));
    gh.factory<_i24.AppCubit>(
        () => _i24.AppCubit(gh<_i21.IsUserSignedInUseCase>()));
    gh.factory<_i25.SignInViewModel>(
        () => _i25.SignInViewModel(gh<_i23.AnonymousSignInUseCase>()));
    return this;
  }
}

class _$FbModule extends _i26.FbModule {}

class _$DIModule extends _i27.DIModule {}
