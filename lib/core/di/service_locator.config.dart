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
import 'package:ecommerce/features/auth/domain/repositories/auth_repositories.dart'
    as _i967;
import 'package:ecommerce/features/auth/domain/use_case/login.dart' as _i280;
import 'package:ecommerce/features/auth/domain/use_case/register.dart' as _i2;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i350;
import 'package:ecommerce/features/home/data/data_source/remote/home_remote_api_data_sources.dart'
    as _i713;
import 'package:ecommerce/features/home/data/data_source/remote/home_remote_data_source.dart'
    as _i58;
import 'package:ecommerce/features/home/data/repository/home_repository_impl.dart'
    as _i25;
import 'package:ecommerce/features/home/domain/repository/home_repository.dart'
    as _i142;
import 'package:ecommerce/features/home/domain/use_case/get_categories.dart'
    as _i491;
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart'
    as _i669;
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
    gh.lazySingleton<_i58.HomeRemoteDataSource>(
        () => _i713.HomeRemoteApiDataSources(gh<_i361.Dio>()));
    gh.singleton<_i279.AuthLocalDataSources>(
        () => _i403.AuthPrefDataSources(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i142.HomeRepository>(
        () => _i25.HomeRepositoryImpl(gh<_i58.HomeRemoteDataSource>()));
    gh.lazySingleton<_i491.GetCategories>(
        () => _i491.GetCategories(gh<_i142.HomeRepository>()));
    gh.lazySingleton<_i669.HomeCubit>(
        () => _i669.HomeCubit(gh<_i491.GetCategories>()));
    gh.singleton<_i967.AuthRepository>(() => _i181.AuthRepositoryImpl(
          gh<_i1064.AuthRemoteDataSources>(),
          gh<_i279.AuthLocalDataSources>(),
        ));
    gh.singleton<_i280.Login>(() => _i280.Login(gh<_i967.AuthRepository>()));
    gh.singleton<_i2.Register>(() => _i2.Register(gh<_i967.AuthRepository>()));
    gh.singleton<_i350.AuthCubit>(() => _i350.AuthCubit(
          gh<_i280.Login>(),
          gh<_i2.Register>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
