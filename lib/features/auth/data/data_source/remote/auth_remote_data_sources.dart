

import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/register_response.dart';

abstract class AuthRemoteDataSources {
  Future<RegisterResponse> register(RegisterRequest request);
  Future<LoginResponse> login(LoginRequest request);
}
