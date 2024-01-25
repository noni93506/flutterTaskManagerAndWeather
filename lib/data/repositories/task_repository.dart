import 'package:task_manager_and_weather/data/models/database/storage/database_manager.dart';
import 'package:task_manager_and_weather/data/models/database/task.dart';
import 'package:task_manager_and_weather/data/models/database/task_db.dart';
import 'package:task_manager_and_weather/domain/repositories/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository{
  final DatabaseManager _databaseManager;

  TaskRepositoryImpl({required DatabaseManager databaseManager}) : _databaseManager = databaseManager;

  @override
  Future<List<Task>> getAllTask() async {
    return  _databaseManager.getAllObjects<TaskDB>().map((e) => e.toDomain).toList();
  }

  @override
  Future loadAllTask(List<Task> tasks) async {
    final toDb = tasks.map((e) => e.toDBObject).toSet().toList();
    await _databaseManager.saveObjects(toDb);
  }

  @override
  Future deleteTask(Task deletedTask) async {
    _databaseManager.delete<TaskDB>(deletedTask.toDBObject);

  }

}