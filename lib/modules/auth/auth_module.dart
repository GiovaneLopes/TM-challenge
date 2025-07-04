import 'package:flutter_modular/flutter_modular.dart';
import 'package:tm_challenge/modules/auth/pages/login_page.dart';
import 'package:tm_challenge/modules/auth/pages/register_page.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage());
    r.child('/register', child: (context) => const RegisterPage());
  }
}
