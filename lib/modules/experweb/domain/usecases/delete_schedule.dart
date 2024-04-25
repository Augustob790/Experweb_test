import '../../data/repositories/schedule_repository.dart';
import '../exception/schedule_exception.dart';

abstract class DeleteScheduleUsecase {
  Future<void> call(int schedule);
}

class DeleteScheduleUsecaseImpl implements DeleteScheduleUsecase {
  final ScheduleRepository repository;

  DeleteScheduleUsecaseImpl({required this.repository});

  @override
  Future<void> call(int schedule) async {
    try {
      return repository.deleteSchedule(schedule);
    } on ScheduleException {
      rethrow;
    }
  }
}
