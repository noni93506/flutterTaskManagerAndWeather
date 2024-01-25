import 'package:task_manager_and_weather/data/models/database/task.dart';
import 'package:task_manager_and_weather/domain/repositories/task_repository.dart';

class LoadAllTasksUseCase {
  final TaskRepository _taskRepository;

  LoadAllTasksUseCase({
    required TaskRepository taskRepository,
  }) : _taskRepository = taskRepository;

  void execute(List<Task> tasks) async {
    await _taskRepository.loadAllTask(tasks);
  }
}
