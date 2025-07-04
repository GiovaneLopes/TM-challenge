import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tm_challenge/libs/modules/user/bloc/user_bloc.dart';

class AppCubit extends Cubit<bool> {
  final UserBloc userBloc;
  AppCubit(this.userBloc) : super(true) {
    userBloc.stream.listen((userState) {
      if (userState.status == UserStatus.loaded && userState.user != null) {
        Modular.to.navigate('/home/');
      } else if (userState.status == UserStatus.loaded &&
          userState.user == null) {
        Modular.to.navigate('/auth/');
      }
    });
  }
}
