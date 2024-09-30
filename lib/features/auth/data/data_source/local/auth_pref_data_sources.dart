import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_sources.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSources)
class AuthPrefDataSources extends AuthLocalDataSources {
  final SharedPreferences sharedPref;
  AuthPrefDataSources(this.sharedPref);
  @override
  Future<void> saveToken(String token) async {
    try {
      await sharedPref.setString(CachedConstants.tokenKey, token);
    } catch (e) {
      throw const LocalException('failed to save token');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return sharedPref.getString(CachedConstants.tokenKey)!;
    } catch (e) {
      throw const LocalException('failed to get token');
    }
  }
}
