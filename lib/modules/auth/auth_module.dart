import 'package:flutter_modular/flutter_modular.dart';
import 'package:tm_challenge/modules/auth/pages/login_page.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage());
  }
}
