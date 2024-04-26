import 'package:flutter_modular/flutter_modular.dart';

import ' data/repositories/auth_repository.dart';
import 'domain/usecases/check_data_user_use_case.dart';
import 'domain/usecases/get_user_login_use_case.dart';
import 'pages/login/login.dart';
import 'presentation/store/auth_store.dart';

class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(AuthStore.new);
    i.addLazySingleton<AuthRepository>(AuthRepositoryImpl.new);
    i.addLazySingleton<GetUserLoginUsecase>(GetUserLoginUsecaseImpl.new);
    i.addLazySingleton<CheckDataUserUsecase>(CheckDataUserUsecaseImpl.new);
    super.exportedBinds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child("/login", child: (_) => LoginPage(authStore: Modular.get()));
    super.routes(r);
  }
}
