import 'dart:async';
import 'package:flutter_sqlite_todo/data/models/task_model.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskLocalDataSource {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'task_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, date TEXT, state INTEGER)');
  }

  Future<void> addTask(TaskModel task) async {
    //print("Adding task to db");
    final db = await database;

    await db.insert(
      'tasks',
      task.toMapSqlite(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

 //TO DO:
  Future<List<TaskModel>> getAllTasks() async {

    /// 1.Obtener una referencia a la base de datos.
 
    // 2.Consultar la tabla para todas las Tareas.

    // 3.Convertir la Lista<Map<String, dynamic> en una Lista<tasks>.
    
  }

  // 4.Implementa un futuro para eliminar tareas especificas.
  // Future<void> deleteTask(id) async { }

  // 5.Implementa un futuro para eliminar todas las tareas
  // Future<void> deleteAll() async { }

  // 6.Implementa un futuro para actualizar tareas
  // Future<void> updateTask(TaskModel task) async {}

}
