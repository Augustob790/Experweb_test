import 'package:sqflite/sqlite_api.dart';

import '../../domain/model/schedule_model.dart';
import '../helpers/database_helpers.dart';

abstract class ScheduleRepository {
  Future<List<ScheduleModel>> getAllSchedules();
  Future<void> addSchedule(ScheduleModel schedule);
  Future<void> updateSchedule(ScheduleModel schedule);
  Future<void> deleteSchedule(int id);
}

class ScheduleRepositoryImpl implements ScheduleRepository {
  String tableName = DB.instance.tableName;
  late Database _database;

  @override
  Future<List<ScheduleModel>> getAllSchedules() async {
    _database = await DB.instance.database;

    try {
      final List<Map<String, dynamic>> maps = await _database.query(tableName);
      List<ScheduleModel> schedules = List.generate(maps.length, (i) {
        return ScheduleModel.fromJson(maps[i]);
      });
      return schedules;
    } catch (e) {
      throw ("Error retrieving schedule: $e");
    }
  }

  @override
  Future<void> addSchedule(ScheduleModel schedule) async {
    try {
      await _database.insert(tableName, schedule.toMap());
    } catch (e) {
      throw ("Error insert schedule: $e");
    }
  }

  @override
  Future<void> updateSchedule(ScheduleModel schedule) async {
    try {
      await _database.update(
        tableName,
        schedule.toMap(),
        where: 'id = ?',
        whereArgs: [schedule.id],
      );
    } catch (e) {
      throw ("Error updating schedule: $e");
    }
  }

  @override
  Future<void> deleteSchedule(int id) async {
    try {
      await _database.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ("Error deleting schedule: $e");
    }
  }
}
