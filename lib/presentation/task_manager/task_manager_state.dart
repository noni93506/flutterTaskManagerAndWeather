import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager_and_weather/data/models/database/task.dart';

part 'task_manager_state.freezed.dart';

@freezed
class TaskManagerState with _$TaskManagerState {
  const TaskManagerState._();

  const factory TaskManagerState({
    required List<Task> initialTasks,
    required List<Task> filteredTasks,
    required Exception? exception,
    required bool isLoading,
  }) = _TaskManagerState;

  factory TaskManagerState.initial() {
    return const TaskManagerState(
      exception: null,
      isLoading: false,
      initialTasks: [],
      filteredTasks: [],
    );
  }
}
