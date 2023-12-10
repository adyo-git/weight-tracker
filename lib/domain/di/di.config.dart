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
    as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../app_cubit.dart' as _i25;
import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i17;
import '../../data/repos/auth_repo/data_sources/auth_remote_data_source.dart'
    as _i14;
import '../../data/repos/auth_repo/data_sources/auth_remote_data_source_impl.dart'
    as _i15;
import '../../data/repos/weight_repo/data_sources/weight_remote_data_source.dart'
    as _i8;
import '../../data/repos/weight_repo/data_sources/weight_remote_data_source_impl.dart'
    as _i9;
import '../../data/repos/weight_repo/weight_repo_impl.dart' as _i11;
import '../../data/utils/firestore_extenions.dart' as _i5;
import '../../presentation/screens/add_bottom_sheet/add_view_model.dart'
    as _i13;
import '../../presentation/screens/edit_weight_bottom_sheet/edit_weight_view_model.dart'
    as _i20;
import '../../presentation/screens/home/home_view_model.dart' as _i26;
import '../../presentation/screens/sign_in/sign_in_view_model.dart' as _i27;
import '../repos/auth_repo.dart' as _i16;
import '../repos/weight_repo.dart' as _i10;
import '../usecases/add_weight_usecase.dart' as _i12;
import '../usecases/anonymous_sign_in_usecase.dart' as _i24;
import '../usecases/delete_weight_usecase.dart' as _i18;
import '../usecases/edit_weight_usecase.dart' as _i19;
import '../usecases/get_weights_stream_usecase.dart' as _i21;
import '../usecases/is_user_signed_in_usecase.dart' as _i22;
import '../usecases/sign_out_usecase.dart' as _i23;
import 'modules/di_module.dart' as _i29;
import 'modules/fb_module.dart' as _i28;

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
    gh.factory<_i5.FirestoreServices>(
        () => _i5.FirestoreServices(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i6.InternetConnectionChecker>(() => dIModule.connectionChecker);
    gh.factoryAsync<_i7.SharedPreferences>(() => dIModule.prefs);
    gh.factory<_i8.WeightRemoteDataSource>(() => _i9.WeightRemoteDataSourceImpl(
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirestoreServices>(),
        ));
    gh.factory<_i10.WeightRepo>(() => _i11.WeightRepoImpl(
          gh<_i6.InternetConnectionChecker>(),
          gh<_i8.WeightRemoteDataSource>(),
        ));
    gh.factory<_i12.AddWeightUseCase>(
        () => _i12.AddWeightUseCase(gh<_i10.WeightRepo>()));
    gh.factory<_i13.AddWeightViewModel>(
        () => _i13.AddWeightViewModel(gh<_i12.AddWeightUseCase>()));
    gh.factory<_i14.AuthRemoteDataSource>(() => _i15.AuthRemoteDataSourceImpl(
          gh<_i3.FirebaseAuth>(),
          gh<_i5.FirestoreServices>(),
        ));
    gh.factory<_i16.AuthRepo>(() => _i17.AuthRepoImpl(
          gh<_i6.InternetConnectionChecker>(),
          gh<_i14.AuthRemoteDataSource>(),
        ));
    gh.factory<_i18.DeleteWeightUseCase>(
        () => _i18.DeleteWeightUseCase(gh<_i10.WeightRepo>()));
    gh.factory<_i19.EditWeightUseCase>(
        () => _i19.EditWeightUseCase(gh<_i10.WeightRepo>()));
    gh.factory<_i20.EditWeightViewModel>(
        () => _i20.EditWeightViewModel(gh<_i19.EditWeightUseCase>()));
    gh.factory<_i21.GetWeightsStreamUseCase>(
        () => _i21.GetWeightsStreamUseCase(gh<_i10.WeightRepo>()));
    gh.factory<_i22.IsUserSignedInUseCase>(
        () => _i22.IsUserSignedInUseCase(gh<_i16.AuthRepo>()));
    gh.factory<_i23.SignOutUseCase>(
        () => _i23.SignOutUseCase(gh<_i16.AuthRepo>()));
    gh.factory<_i24.AnonymousSignInUseCase>(
        () => _i24.AnonymousSignInUseCase(gh<_i16.AuthRepo>()));
    gh.factory<_i25.AppCubit>(
        () => _i25.AppCubit(gh<_i22.IsUserSignedInUseCase>()));
    gh.factory<_i26.HomeViewModel>(() => _i26.HomeViewModel(
          gh<_i21.GetWeightsStreamUseCase>(),
          gh<_i18.DeleteWeightUseCase>(),
          gh<_i23.SignOutUseCase>(),
        ));
    gh.factory<_i27.SignInViewModel>(
        () => _i27.SignInViewModel(gh<_i24.AnonymousSignInUseCase>()));
    return this;
  }
}

class _$FbModule extends _i28.FbModule {}

class _$DIModule extends _i29.DIModule {}
