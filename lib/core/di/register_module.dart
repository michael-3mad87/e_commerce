import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final sharedpref = await SharedPreferences.getInstance();
          final token = sharedpref.getString(CachedConstants.tokenKey);
          if (token != null) options.headers[APIConstants.tokenKey] = token;
          return handler.next(options);
        },
      ),
    );
    return dio;
  }

  @preResolve
  Future<SharedPreferences> getSharedPref() => SharedPreferences.getInstance();
}
