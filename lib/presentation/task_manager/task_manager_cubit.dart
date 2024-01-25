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
  })  : _getAllTasksUseCase = getAllTasksUseCase,
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
      await Future.delayed(const Duration(milliseconds: 300));
      List<Task> result = await _getAllTasksUseCase.execute();

      print(result);
      emit(state.copyWith(
          initialTasks: result, filteredTasks: result, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      print("error get $e");
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
    required int category,
  }) async {
    List<Task> buffer = [];
    buffer.addAll(state.initialTasks);
    buffer.add(
      Task(
        id: state.initialTasks.isNotEmpty ? state.initialTasks.last.id + 1 : 0,
        title: title,
        description: description,
        category: category,
        done: false,
      ),
    );
    emit(state.copyWith(initialTasks: buffer));
    _saveTasks();
  }

  deleteTask(Task task) async {
    List<Task> buffer = [];
    buffer.addAll(state.initialTasks);
    buffer.remove(task);
    emit(state.copyWith(initialTasks: buffer));
    _deleteTaskUseCase.execute(task);
    _getTasks(false);
  }

  markAsReady(Task task) async {
    List<Task> buffer = [];
    buffer.addAll(state.initialTasks);
    buffer.remove(task);
    buffer.add(task.copyWith(done: !task.done));
    emit(state.copyWith(initialTasks: buffer));
    _saveTasks();
  }

  sortByDone() {
    List<Task> buffer = [];
    buffer.addAll(state.initialTasks);
    buffer.sort((a, b) {
      if(a.done){
        return 1;
      } else {
        return 0;
      }
      });
    emit(state.copyWith(filteredTasks: buffer));
  }
  filterByCat(int number){
    if(number != 9) {
      List<Task> buffer = [];
      buffer.addAll(state.initialTasks);
      buffer.removeWhere((element) => element.category != number);
      emit(state.copyWith(filteredTasks: buffer));
    } else {
      emit(state.copyWith(filteredTasks: state.initialTasks));
    }
  }
}
