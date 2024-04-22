import 'package:flutter_modular/flutter_modular.dart';
import 'pages/home/home_page.dart';

class ExperwebModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/home", child: (_) => const HomePage());
    super.routes(r);
  }
}
