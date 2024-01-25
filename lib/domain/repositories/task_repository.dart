import 'package:task_manager_and_weather/data/models/database/task.dart';

abstract class TaskRepository{
  Future<List<Task>> getAllTask();
  Future loadAllTask(List<Task> tasks);
}