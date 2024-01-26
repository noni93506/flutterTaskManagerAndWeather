import 'package:get_it/get_it.dart';
import 'package:task_manager_and_weather/domain/repositories/task_repository.dart';
import 'package:task_manager_and_weather/domain/repositories/weather_repository.dart';
import 'package:task_manager_and_weather/domain/use_cases/delete_task_use_case.dart';
import 'package:task_manager_and_weather/domain/use_cases/get_all_tasks_use_case.dart';
import 'package:task_manager_and_weather/domain/use_cases/get_current_weather_use_case.dart';
import 'package:task_manager_and_weather/domain/use_cases/load_all_tasks_use_case.dart';

/// all [UseCase] dependency init
class AppServiceLocatorUseCases {
  static Future<void> setup({required GetIt instance}) async {
    instance.registerFactory<GetCurrentWeatherUseCase>(
        // get weather use case get it instance
        () => GetCurrentWeatherUseCase(
              weatherRepository: instance<WeatherRepository>(),
        )
    );

    // get all tasks from db use case get it instance
    instance.registerFactory<GetAllTasksUseCase>(
        () => GetAllTasksUseCase(
            taskRepository: instance<TaskRepository>(),
        )
    );

    // load all tasks from db use case get it instance
    instance.registerFactory<LoadAllTasksUseCase>(
        () => LoadAllTasksUseCase(
          taskRepository: instance<TaskRepository>(),
        )
    );

    instance.registerFactory<DeleteTaskUseCase>(
        () => DeleteTaskUseCase(
          taskRepository: instance<TaskRepository>(),
        )
    );
  }
}
