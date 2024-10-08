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
import 'package:ecommerce/features/cart/data/data_source/remote/cart_api_remote_data_source.dart'
    as _i490;
import 'package:ecommerce/features/cart/data/data_source/remote/cart_remote_data_source.dart'
    as _i984;
import 'package:ecommerce/features/cart/data/repositories/cart_repositories_impl.dart'
    as _i117;
import 'package:ecommerce/features/cart/domain/repositories/cart_repositories.dart'
    as _i188;
import 'package:ecommerce/features/cart/domain/use_case/add_to_cart.dart'
    as _i290;
import 'package:ecommerce/features/cart/domain/use_case/delete_from_cart.dart'
    as _i979;
import 'package:ecommerce/features/cart/domain/use_case/get_cart.dart' as _i2;
import 'package:ecommerce/features/cart/domain/use_case/update_cart.dart'
    as _i807;
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart'
    as _i769;
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
import 'package:ecommerce/features/products/data/data_sources/remote/products_api_data_sources.dart'
    as _i585;
import 'package:ecommerce/features/products/data/data_sources/remote/products_remote_data_sources.dart'
    as _i825;
import 'package:ecommerce/features/products/data/repository/products_repository_impl.dart'
    as _i418;
import 'package:ecommerce/features/products/domain/repository/products_repository.dart'
    as _i647;
import 'package:ecommerce/features/products/domain/use_cases/get_products.dart'
    as _i551;
import 'package:ecommerce/features/products/presentation/cubit/product_cubit.dart'
    as _i320;
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
    gh.lazySingleton<_i984.CartRemoteDataSource>(
        () => _i490.CartApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i1064.AuthRemoteDataSources>(
        () => _i1000.AuthRemoteApiDataSources(gh<_i361.Dio>()));
    gh.lazySingleton<_i58.HomeRemoteDataSource>(
        () => _i713.HomeRemoteApiDataSources(gh<_i361.Dio>()));
    gh.lazySingleton<_i825.ProductsRemoteDataSources>(
        () => _i585.ProductsApiDataSources(gh<_i361.Dio>()));
    gh.lazySingleton<_i188.CartRepositories>(
        () => _i117.CartRepositoriesImpl(gh<_i984.CartRemoteDataSource>()));
    gh.singleton<_i279.AuthLocalDataSources>(
        () => _i403.AuthPrefDataSources(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i142.HomeRepository>(
        () => _i25.HomeRepositoryImpl(gh<_i58.HomeRemoteDataSource>()));
    gh.lazySingleton<_i491.GetCategories>(
        () => _i491.GetCategories(gh<_i142.HomeRepository>()));
    gh.lazySingleton<_i669.HomeCubit>(
        () => _i669.HomeCubit(gh<_i491.GetCategories>()));
    gh.lazySingleton<_i290.AddToCart>(
        () => _i290.AddToCart(gh<_i188.CartRepositories>()));
    gh.lazySingleton<_i979.DeleteFromCart>(
        () => _i979.DeleteFromCart(gh<_i188.CartRepositories>()));
    gh.lazySingleton<_i2.GetCart>(
        () => _i2.GetCart(gh<_i188.CartRepositories>()));
    gh.lazySingleton<_i807.UpdateCart>(
        () => _i807.UpdateCart(gh<_i188.CartRepositories>()));
    gh.lazySingleton<_i647.ProductsRepository>(() =>
        _i418.ProductsRepositoryImpl(gh<_i825.ProductsRemoteDataSources>()));
    gh.singleton<_i967.AuthRepository>(() => _i181.AuthRepositoryImpl(
          gh<_i1064.AuthRemoteDataSources>(),
          gh<_i279.AuthLocalDataSources>(),
        ));
    gh.factory<_i769.CartCubit>(() => _i769.CartCubit(
          gh<_i290.AddToCart>(),
          gh<_i2.GetCart>(),
          gh<_i807.UpdateCart>(),
          gh<_i979.DeleteFromCart>(),
        ));
    gh.singleton<_i280.Login>(() => _i280.Login(gh<_i967.AuthRepository>()));
    gh.singleton<_i2.Register>(() => _i2.Register(gh<_i967.AuthRepository>()));
    gh.lazySingleton<_i551.GetProducts>(
        () => _i551.GetProducts(gh<_i647.ProductsRepository>()));
    gh.factory<_i320.ProductCubit>(
        () => _i320.ProductCubit(gh<_i551.GetProducts>()));
    gh.singleton<_i350.AuthCubit>(() => _i350.AuthCubit(
          gh<_i280.Login>(),
          gh<_i2.Register>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
