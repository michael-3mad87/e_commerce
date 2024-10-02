import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_sources.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_sources.dart';
import 'package:ecommerce/features/auth/data/mappers/user_mappers.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repositories.dart';

import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources _remoteDataSources;
  final AuthLocalDataSources _localDataSources;
  AuthRepositoryImpl(this._remoteDataSources, this._localDataSources);
  @override
  Future<Either<Failure, User>> register(RegisterRequest request) async {
    try {
      final response = await _remoteDataSources.register(request);
      _localDataSources.saveToken(response.token);
      return Right(response.user.toEntity);
    } on AppException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> login(LoginRequest request) async {
    try {
      final response = await _remoteDataSources.login(request);
      await _localDataSources.saveToken(response.token);
      return Right(response.user.toEntity);
    } on AppException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
