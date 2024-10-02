import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_sources.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/register_response.dart';

import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSources)
class AuthRemoteApiDataSources implements AuthRemoteDataSources {
  final Dio _dio;
 const AuthRemoteApiDataSources(this._dio);
  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post(
        APIConstants.registerEndPoint,
        data: request.toJSon(),
      );

      return RegisterResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to register');
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        APIConstants.loginEndPoint,
        data: request.toJSon(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to login');
    }
  }
}
