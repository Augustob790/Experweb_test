import 'package:flutter_modular/flutter_modular.dart';

import '../auth/auth_module.dart';
import 'data/repositories/schedule_repository.dart';
import 'domain/usecases/delete_schedule.dart';
import 'domain/usecases/get_all_schedule.dart';
import 'domain/usecases/insert_schedule.dart';
import 'domain/usecases/update_schedule.dart';
import 'pages/create/create_schedule.dart';
import 'pages/home/home_page.dart';
import 'presentation/store/schedule_store.dart';

class ExperwebModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<ScheduleRepository>(ScheduleRepositoryImpl.new);
    i.addLazySingleton<GetAllScheduleUsecase>(GetAllScheduleUsecaseImpl.new);
    i.addLazySingleton<DeleteScheduleUsecase>(DeleteScheduleUsecaseImpl.new);
    i.addLazySingleton<InsertScheduleUsecase>(InsertScheduleUsecaseImpl.new);
    i.addLazySingleton<UpdateScheduleUsecase>(UpdateScheduleUsecaseImpl.new);
    i.addLazySingleton(ScheduleStore.new);
  }

  @override
  List<Module> get imports => [AuthModule()];

  @override
  void routes(RouteManager r) {
    r.child("/home",
        child: (_) =>
            HomePage(authStore: Modular.get(), scheduleStore: Modular.get()));
    r.child("/addschedule",
        child: (_) => CreateSchedulePage(
            authStore: Modular.get(), scheduleStore: Modular.get()));
    super.routes(r);
  }
}
