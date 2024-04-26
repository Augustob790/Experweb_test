import 'package:flutter_modular/flutter_modular.dart';

import 'core/pages/splash/splash.dart';
import 'modules/auth/auth_module.dart';
import 'modules/experweb/experweb_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
        ExperwebModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => SplashPage(authStore: Modular.get()));
    r.module("/auth", module: AuthModule());
    r.module("/experweb", module: ExperwebModule());
  }
}
