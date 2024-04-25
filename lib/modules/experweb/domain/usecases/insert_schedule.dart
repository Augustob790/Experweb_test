import '../../data/repositories/schedule_repository.dart';
import '../exception/schedule_exception.dart';
import '../model/schedule_model.dart';

abstract class InsertScheduleUsecase {
  Future<void> call(ScheduleModel schedule);
}

class InsertScheduleUsecaseImpl implements InsertScheduleUsecase {
  final ScheduleRepository repository;

  InsertScheduleUsecaseImpl({required this.repository});

  @override
  Future<void> call(ScheduleModel schedule) async {
    try {
      return repository.addSchedule(schedule);
    } on ScheduleException {
      rethrow;
    }
  }
}
