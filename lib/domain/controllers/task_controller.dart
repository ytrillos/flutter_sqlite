import 'package:flutter_sqlite_todo/data/models/task_model.dart';
import 'package:flutter_sqlite_todo/data/repositories/task_repository.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final _tasks = <TaskModel>[].obs;
  TaskRepository repository = Get.find();
  //List<TaskModel> get getAllTasks =>

  List<TaskModel> get tasks => _tasks;

  @override
  onInit() {
    super.onInit();
    getAllTasks();
  }

  Future<void> addTask(task) async {
    // TODO metodo para añadir tareas
    await repository.addTask(task);
    await getAllTasks();
  }

  Future<void> getAllTasks() async {
    // TODO metodo para obtener todas las tareas existentes
    var list = await repository.getAllTasks();
    _tasks.value = list;
  }

  Future<void> deleteTask(id) async {
    // TODO metodo para eliminar una tarea especifica
    await repository.deleteTask(id);
    await getAllTasks();
  }

  Future<void> deleteAll() async {
    // TODO metodo para eliminar todas las tareas
    await repository.deleteAll();
    await getAllTasks();
  }

  Future<void> updateTask(user) async {
    // TODO metodo para actualizar tareas de un usuario especifico
    await repository.updateTask(user);
    await getAllTasks();
  }
}
