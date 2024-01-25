import 'package:task_manager_and_weather/data/models/database/task.dart';
import 'package:task_manager_and_weather/domain/repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository _taskRepository;

  DeleteTaskUseCase({
    required TaskRepository taskRepository,
  }) : _taskRepository = taskRepository;

  void execute(Task deletedTask) async {
    await _taskRepository.deleteTask(deletedTask);
  }
}
