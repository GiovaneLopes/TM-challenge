import 'package:tm_challenge/app_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tm_challenge/modules/auth/auth_module.dart';
import 'package:tm_challenge/modules/home/home_module.dart';
import 'package:tm_challenge/modules/auth/bloc/auth_bloc.dart';
import 'package:tm_challenge/modules/auth/pages/splash_page.dart';
import 'package:tm_challenge/libs/modules/user/bloc/user_bloc.dart';
import 'package:tm_challenge/libs/modules/user/repositories/user_repository.dart';
import 'package:tm_challenge/libs/modules/user/datasource/user_local_datasource.dart';
import 'package:tm_challenge/libs/modules/user/datasource/user_remote_datasource.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<UserRemoteDatasource>(() => UserRemoteDatasourceImpl(
          firebaseAuth: i(),
          firebaseFirestore: i(),
        ));
    i.addLazySingleton<UserLocalDatasource>(() => UserLocalDatasourceImpl());
    i.addSingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    i.addSingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
    i.addLazySingleton<UserRepository>(() => UserRepositoryImpl(
          remoteDatasource: i<UserRemoteDatasource>(),
          localDatasource: i<UserLocalDatasource>(),
        ));
    i.addLazySingleton<AuthBloc>(
        () => AuthBloc(i<UserBloc>(), i<UserRepository>()));
    i.addSingleton<UserBloc>(() => UserBloc(i<UserRepository>()));
    i.addSingleton<AppCubit>(() => AppCubit(i()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
