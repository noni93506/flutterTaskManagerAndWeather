import 'package:task_manager_and_weather/data/models/database/task.dart';
import 'package:task_manager_and_weather/domain/repositories/task_repository.dart';

class GetAllTasksUseCase {
  final TaskRepository _taskRepository;

  GetAllTasksUseCase({
    required TaskRepository taskRepository,
  }) : _taskRepository = taskRepository;

  Future<List<Task>> execute() async {
    return await _taskRepository.getAllTask();
  }
}
