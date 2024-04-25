import '../../data/repositories/schedule_repository.dart';
import '../exception/schedule_exception.dart';
import '../model/schedule_model.dart';

abstract class GetAllScheduleUsecase {
  Future<List<ScheduleModel>> call();
}

class GetAllScheduleUsecaseImpl implements GetAllScheduleUsecase {
  final ScheduleRepository repository;

  GetAllScheduleUsecaseImpl({required this.repository});

  @override
  Future<List<ScheduleModel>> call() async {
    try {
      return repository.getAllSchedules();
    } on ScheduleException {
      rethrow;
    }
  }
}
