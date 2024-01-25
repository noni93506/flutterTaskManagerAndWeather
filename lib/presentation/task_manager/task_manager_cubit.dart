import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_and_weather/data/models/database/task.dart';
import 'package:task_manager_and_weather/domain/use_cases/delete_task_use_case.dart';
import 'package:task_manager_and_weather/domain/use_cases/get_all_tasks_use_case.dart';
import 'package:task_manager_and_weather/domain/use_cases/load_all_tasks_use_case.dart';

import 'task_manager_state.dart';

class TaskManagerCubit extends Cubit<TaskManagerState> {
  final GetAllTasksUseCase _getAllTasksUseCase;
  final LoadAllTasksUseCase _loadAllTasksUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  TaskManagerCubit({
    required GetAllTasksUseCase getAllTasksUseCase,
    required LoadAllTasksUseCase loadAllTasksUseCase,
    required DeleteTaskUseCase deleteTaskUseCase,
  })
      : _getAllTasksUseCase = getAllTasksUseCase,
        _loadAllTasksUseCase = loadAllTasksUseCase,
        _deleteTaskUseCase = deleteTaskUseCase,
        super(TaskManagerState.initial()) {
    _getTasks(true);
  }

  _getTasks(bool first) async {
    try {
      if (first) {
        emit(state.copyWith(isLoading: true));
      }
      List<Task> result = await _getAllTasksUseCase.execute();
      if (result.isNotEmpty) {
        emit(state.copyWith(initialTasks: result, filteredTasks: result));
      }
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      print(e);
    }
  }

  _saveTasks() async {
    try {
      _loadAllTasksUseCase.execute(state.initialTasks);
      _getTasks(false);
    } catch (e) {
      print(e);
    }

    _getTasks(false);
  }

  addTask({
    required String title,
    required String description,
    required int category ,
  }) async {
    List<Task> buffer = [];
    buffer.addAll(state.initialTasks);
    buffer.add(
      Task(
        id: state.initialTasks.isNotEmpty ? state.initialTasks.last.id + 1: 0,
        title: title,
        description: description,//todo help yourself may not work
        category: category,
      ),);
    emit(state.copyWith(initialTasks: buffer));
    _saveTasks();
  }

  deleteTask(Task task) async {
    state.initialTasks.remove(task);
    emit(state.copyWith(initialTasks: state.initialTasks));
     _deleteTaskUseCase.execute(task);
     _getTasks(false);
  }


}
