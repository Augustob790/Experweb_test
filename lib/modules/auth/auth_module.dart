import 'package:flutter_modular/flutter_modular.dart';

import 'pages/login/login.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/login", child: (_) => const LoginPage());
    super.routes(r);
  }
}
