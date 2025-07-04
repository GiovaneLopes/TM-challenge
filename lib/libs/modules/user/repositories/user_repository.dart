import 'package:tm_challenge/libs/modules/user/models/login_data.dart';
import 'package:tm_challenge/libs/modules/user/models/user_model.dart';
import 'package:tm_challenge/libs/modules/user/datasource/user_local_datasource.dart';
import 'package:tm_challenge/libs/modules/user/datasource/user_remote_datasource.dart';

abstract class UserRepository {
  Future<UserModel?> getUser();

  Future<void> createUser({
    required UserModel user,
    required String password,
  });

  Future<void> deleteUser({
    required String cpf,
  });

  Future<void> signIn({
    required String cpf,
    required String password,
  });

  Future<void> signOut();

  Future<void> resetPassword({
    required String email,
  });

  Future<void> cacheUserLogin(LoginData userLogin);

  Future<LoginData?> getCachedUserLogin();

  Future<void> cleanUserLogin();
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDatasource;
  final UserLocalDatasource localDatasource;

  UserRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<UserModel?> getUser() async {
    return await remoteDatasource.getUser();
  }

  @override
  Future<void> createUser({
    required UserModel user,
    required String password,
  }) async {
    await remoteDatasource.createUser(
      user: user,
      password: password,
    );
  }

  @override
  Future<void> deleteUser({required String cpf}) async {
    try {
      await remoteDatasource.deleteUser(cpf: cpf);
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }

  @override
  Future<void> signIn({
    required String cpf,
    required String password,
  }) async {
    try {
      await remoteDatasource.signIn(cpf: cpf, password: password);
    } catch (e) {
      throw Exception('Error signing in: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await remoteDatasource.signOut();
    } catch (e) {
      throw Exception('Error signing out: $e');
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await remoteDatasource.resetPassword(email: email);
    } catch (e) {
      throw Exception('Error resetting password: $e');
    }
  }

  @override
  Future<void> cacheUserLogin(
    LoginData userLogin,
  ) async {
    await localDatasource.cacheUserLogin(userLogin);
  }

  @override
  Future<LoginData?> getCachedUserLogin() async {
    return await localDatasource.getCachedUserLogin();
  }

  @override
  Future<void> cleanUserLogin() async {
    await localDatasource.cleanUserLogin();
  }
}
