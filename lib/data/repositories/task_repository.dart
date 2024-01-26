import 'package:task_manager_and_weather/data/models/database/storage/database_manager.dart';
import 'package:task_manager_and_weather/data/models/database/task.dart';
import 'package:task_manager_and_weather/data/models/database/task_db.dart';
import 'package:task_manager_and_weather/domain/repositories/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository{
  final DatabaseManager _databaseManager;

  TaskRepositoryImpl({required DatabaseManager databaseManager}) : _databaseManager = databaseManager;

  @override
  Future<List<Task>> getAllTask() async {
    return  _databaseManager.getAllObjects<TaskDB>().map((e) => e.toDomain).toList(); // get all TaskDB in DB
  }

  @override
  Future loadAllTask(List<Task> tasks) async {
    final toDb = tasks.map((e) => e.toDBObject).toSet().toList(); //all of Task changes to TaskDB to be stored in DB
    await _databaseManager.saveObjects(toDb);
  }

  @override
  Future deleteTask(Task deletedTask) async {
    final buffer = _databaseManager.getObjectById<TaskDB>(deletedTask.id); // to delete an realm obj, it needs to be managed, so first we find it in DB than delete
    if(buffer!= null) {
      await _databaseManager.delete<TaskDB>(buffer);
    }

  }

}