import 'package:flutter_modular/flutter_modular.dart';
import 'package:tm_challenge/modules/home/pages/home_page.dart';
import 'package:tm_challenge/modules/home/pages/auto_webview_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) => {};

  @override
  void routes(r) => {
        r.child(
          '/',
          child: (context) => const HomePage(),
        ),
        r.child(
          '/auto',
          child: (context) => const AutoWebViewPage(),
        )
      };
}
