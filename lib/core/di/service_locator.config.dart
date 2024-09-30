// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/core/di/register_module.dart' as _i709;
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_sources.dart'
    as _i279;
import 'package:ecommerce/features/auth/data/data_source/local/auth_pref_data_sources.dart'
    as _i403;
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_api_data_sources.dart'
    as _i1000;
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_sources.dart'
    as _i1064;
import 'package:ecommerce/features/auth/data/repository/auth_repository.dart'
    as _i181;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i350;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.getSharedPref(),
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i1064.AuthRemoteDataSources>(
        () => _i1000.AuthRemoteApiDataSources(gh<_i361.Dio>()));
    gh.singleton<_i279.AuthLocalDataSources>(
        () => _i403.AuthPrefDataSources(gh<_i460.SharedPreferences>()));
    gh.singleton<_i181.AuthRepository>(() => _i181.AuthRepository(
          gh<_i1064.AuthRemoteDataSources>(),
          gh<_i279.AuthLocalDataSources>(),
        ));
    gh.singleton<_i350.AuthCubit>(
        () => _i350.AuthCubit(gh<_i181.AuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
