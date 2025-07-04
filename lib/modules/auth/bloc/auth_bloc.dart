import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tm_challenge/libs/modules/user/bloc/user_bloc.dart';
import 'package:tm_challenge/libs/modules/user/models/login_data.dart';
import 'package:tm_challenge/libs/modules/user/models/user_model.dart';
import 'package:tm_challenge/libs/modules/user/repositories/user_repository.dart';

part 'auth_state.dart';

enum AuthStatus { initial, loading, loaded, error }

class AuthBloc extends Cubit<AuthState> {
  final UserBloc userBloc;
  final UserRepository userRepository;

  AuthBloc(this.userBloc, this.userRepository) : super(AuthState()) {
    userBloc.stream.listen((userState) {
      if (userState.user != null) {
        emit(state.copyWith(
          user: () => userState.user,
        ));
        Modular.to.navigate('/home/');
      } else if (userState.user == null) {
        emit(state.copyWith(
          user: () => null,
        ));
      }
    });
  }

  Future<void> getCachedData() async {
    final authCachedData = await userRepository.getCachedUserLogin();
    emit(state.copyWith(
      authCachedData: () => authCachedData,
      isRememberMe: authCachedData != null,
    ));
  }

  Future<void> rememberMeChanged(bool? value) async {
    emit(state.copyWith(isRememberMe: value));
  }

  void signIn(LoginData loginData) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      await userBloc.signIn(cpf: loginData.cpf, password: loginData.password);
      emit(state.copyWith(status: AuthStatus.loaded));
      if (state.isRememberMe) {
        userRepository.cacheUserLogin(loginData);
        emit(state.copyWith(authCachedData: () => loginData));
      } else {
        userRepository.cleanUserLogin();
        emit(state.copyWith(authCachedData: () => null));
      }
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }

  void register(UserModel user, String password) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      await userBloc.createUser(user: user, password: password);
      emit(state.copyWith(status: AuthStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }

  void resetPassword(String email) async {
    try {
      await userRepository.resetPassword(email: email);
      emit(state.copyWith(status: AuthStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }

  void signOut() {
    userBloc.signOut();
  }
}
