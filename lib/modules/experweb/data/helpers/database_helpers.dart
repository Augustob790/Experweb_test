// ignore_for_file: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  final  String tableName = 'schedule';
  static Database? _database;
  static const String dbName = 'schedule.db';

  get database async {
    if (_database != null) return _database;

    return await initDatabase();
  }

  initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, dbName);
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            victimName TEXT,
            scheduleTo TEXT,
            dateSchedule TEXT,
            professionalId INTEGER,
            city TEXT,
            state TEXT,
            street TEXT,
            number TEXT
          )
        ''');
    });
  }
}
