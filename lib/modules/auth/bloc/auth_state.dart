part of 'auth_bloc.dart';

class AuthState {
  final UserModel? user;
  final AuthStatus status;
  final bool isRememberMe;
  final LoginData? authCachedData;

  AuthState({
    this.user,
    this.status = AuthStatus.initial,
    this.isRememberMe = false,
    this.authCachedData,
  });

  AuthState copyWith({
    UserModel? Function()? user,
    AuthStatus? status,
    bool? isRememberMe,
    LoginData? Function()? authCachedData,
  }) {
    return AuthState(
      user: user != null ? user() : this.user,
      status: status ?? this.status,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      authCachedData:
          authCachedData != null ? authCachedData() : this.authCachedData,
    );
  }

  @override
  String toString() {
    return 'AuthState(user: $user, status: $status, isRememberMe: $isRememberMe, authCachedData: $authCachedData)';
  }
}
