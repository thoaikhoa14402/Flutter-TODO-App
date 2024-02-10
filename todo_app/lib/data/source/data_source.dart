import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/utils/app_keys.dart';
import 'package:todo_app/utils/task_keys.dart';

class DataSource {
  static final DataSource _instance = DataSource._();
  factory DataSource() => _instance;
  static Database? _database;

  DataSource._() {
    _initDB();
  }

// This means "if _database is null, then assign the result of await _initDB() to _database.
// If _database is not null, then do nothing."
  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppKeys.dbTable} (
        ${TaskKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TaskKeys.title} TEXT,
        ${TaskKeys.description} TEXT,
        ${TaskKeys.date} TEXT,
        ${TaskKeys.time} TEXT,
        ${TaskKeys.category} TEXT,
        ${TaskKeys.isCompleted} INTEGER
      )
    ''');
  }

  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        AppKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          AppKeys.dbTable,
          where: 'id = ?',
          whereArgs: [task.id],
        );
      },
    );
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        AppKeys.dbTable,
        task.toJson(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    });
  }

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      AppKeys.dbTable,
      orderBy: "id DESC",
    );
    return List.generate(
      maps.length,
      (index) {
        return Task.fromJson(maps[index]);
      },
    );
  }
}
