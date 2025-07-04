import 'package:tm_challenge/libs/modules/user/bloc/user_bloc.dart';
import 'package:tm_challenge/libs/modules/user/models/user_model.dart';

class UserState {
  UserModel? user;
  UserStatus status;
  UserState({
    this.user,
    this.status = UserStatus.initial,
  });

  bool get isAuthenticated => user != null;

  UserState copyWith({
    UserModel? Function()? user,
    UserStatus? status,
  }) {
    return UserState(
      user: user != null ? user() : this.user,
      status: status ?? this.status,
    );
  }
}
