import '../../data/repositories/schedule_repository.dart';
import '../exception/schedule_exception.dart';
import '../model/schedule_model.dart';

abstract class UpdateScheduleUsecase {
  Future<void> call(ScheduleModel schedule);
}

class UpdateScheduleUsecaseImpl implements UpdateScheduleUsecase {
  final ScheduleRepository repository;

  UpdateScheduleUsecaseImpl({required this.repository});

  @override
  Future<void> call(ScheduleModel schedule) async {
    try {
      return repository.updateSchedule(schedule);
    } on ScheduleException {
      rethrow;
    }
  }
}
