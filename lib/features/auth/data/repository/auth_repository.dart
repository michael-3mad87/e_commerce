import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_sources.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_sources.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';

import 'package:injectable/injectable.dart';
@singleton
class AuthRepository {
  final AuthRemoteDataSources remoteDataSources;
  final AuthLocalDataSources localDataSources;
  AuthRepository(this.remoteDataSources, this.localDataSources);
  Future<Either<Failure, UserModel>> register(RegisterRequest request) async {
    try {
      final response = await remoteDataSources.register(request);
      localDataSources.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (e) {
      return Left(Failure(e.message));
    }
  }

  Future<Either<Failure, UserModel>> login(LoginRequest request) async {
    try {
      final response = await remoteDataSources.login(request);
      await localDataSources.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
