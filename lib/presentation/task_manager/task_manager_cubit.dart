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
    _getTasks(true);  // when screen opens, initialize DB, get the key, and read TaskDB
  }

  _getTasks(bool first) async {
    try {
      if (first) {
        emit(state.copyWith(isLoading: true));
      }
      await Future.delayed(const Duration(milliseconds: 300)); // for DB to initialize, a little delay used
      List<Task> result = await _getAllTasksUseCase.execute();
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
        id: state.initialTasks.isNotEmpty ? state.initialTasks.last.id + 1 : 0, // if there is no Task in db, give 0 as id, but if there is, finds the last id, and ads 1 to it
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
    _deleteTaskUseCase.execute(task); // for better ux, firstly update state, then delete in DB and get all from DB to be sure it deleted
    _getTasks(false);
  }

  markAsReady(Task task) async {
    List<Task> buffer = [];
    buffer.addAll(state.initialTasks);
    buffer.remove(task);
    buffer.add(task.copyWith(done: !task.done)); // could be done by other way like
    // this : buffer.where((element) => element.id == task.id).first.copyWith(done: !task.done); but i don`t think it will work properly
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
      }); // grouped by done check
    emit(state.copyWith(filteredTasks: buffer));
  }
  filterByCat(int number){
    if(number != 9) {
      List<Task> buffer = [];
      buffer.addAll(state.initialTasks);
      buffer.removeWhere((element) => element.category != number);
      emit(state.copyWith(filteredTasks: buffer)); // simple filter by the category number selected in snackbar
    } else {
      emit(state.copyWith(filteredTasks: state.initialTasks));
    }
  }
}
