import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tm_challenge/libs/modules/user/bloc/user_state.dart';
import 'package:tm_challenge/libs/modules/user/models/login_data.dart';
import 'package:tm_challenge/libs/modules/user/models/user_model.dart';
import 'package:tm_challenge/libs/modules/user/repositories/user_repository.dart';

enum UserStatus {
  initial,
  loading,
  loaded,
  error,
}

class UserBloc extends Cubit<UserState> {
  final UserRepository repository;
  UserBloc(this.repository) : super(UserState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(status: UserStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    try {
      final user = await repository.getUser();
      emit(state.copyWith(
        user: () => user,
        status: UserStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error));
    }
  }

  Future<void> createUser({
    required UserModel user,
    required String password,
  }) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await repository.createUser(user: user, password: password);
      await init();
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error));
    }
  }

  Future<void> deleteUser({required String cpf}) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await repository.deleteUser(cpf: cpf);
      emit(state.copyWith(status: UserStatus.initial));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error));
    }
  }

  Future<void> signIn({
    required String cpf,
    required String password,
  }) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await repository.signIn(cpf: cpf, password: password);
      await init();
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error));
    }
  }

  Future<void> signOut() async {
    try {
      await repository.signOut();
      emit(state.copyWith(
        status: UserStatus.loaded,
        user: () => null,
      ));
      Modular.to.navigate('/auth/');
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error));
    }
  }

  Future<void> cacheUserLogin(
    LoginData userLogin,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await repository.cacheUserLogin(userLogin);
      emit(state.copyWith(status: UserStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error));
    }
  }

  Future<void> cleanUserLogin() async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await repository.cleanUserLogin();
      emit(state.copyWith(status: UserStatus.initial));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error));
    }
  }
}
