import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tm_challenge/libs/modules/user/models/login_data.dart';

abstract class UserLocalDatasource {
  Future<void> cacheUserLogin(LoginData userLogin);

  Future<LoginData?> getCachedUserLogin();

  Future<void> cleanUserLogin();
}

class UserLocalDatasourceImpl extends UserLocalDatasource {
  UserLocalDatasourceImpl();
  final SharedPreferencesAsync _localStorage = SharedPreferencesAsync();
  static const String _userLogin = 'userLogin';

  @override
  Future<void> cacheUserLogin(LoginData userLogin) async {
    await _localStorage.setString(_userLogin, jsonEncode(userLogin.toMap()));
  }

  @override
  Future<LoginData?> getCachedUserLogin() async {
    final String? cachedData = await _localStorage.getString(_userLogin);
    if (cachedData != null) {
      return LoginData.fromMap(
          Map<String, String>.from(jsonDecode(cachedData)));
    }
    return null;
  }

  @override
  Future<void> cleanUserLogin() async {
    await _localStorage.clear();
  }
}
