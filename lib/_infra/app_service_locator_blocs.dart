import 'package:get_it/get_it.dart';
import 'package:task_manager_and_weather/domain/use_cases/delete_task_use_case.dart';
import 'package:task_manager_and_weather/domain/use_cases/get_all_tasks_use_case.dart';
import 'package:task_manager_and_weather/domain/use_cases/get_current_weather_use_case.dart';
import 'package:task_manager_and_weather/domain/use_cases/load_all_tasks_use_case.dart';
import 'package:task_manager_and_weather/presentation/task_manager/task_manager_cubit.dart';
import 'package:task_manager_and_weather/presentation/weather_screen/weather_cubit.dart';

class AppServiceLocatorBlocs {

  /// all screen [Cubit] dependency init
  static Future<void> setup({required GetIt instance}) async {
    instance.registerFactory<WeatherCubit>(
      () => // Weather screen bloc get it instance
          WeatherCubit(
        getCurrentWeatherUseCase: instance<GetCurrentWeatherUseCase>(),
      ),
    );

    instance.registerFactory<TaskManagerCubit>(
      () => // Task screen bloc get it instance
          TaskManagerCubit(
            getAllTasksUseCase: instance<GetAllTasksUseCase>(),
            loadAllTasksUseCase: instance<LoadAllTasksUseCase>(),
            deleteTaskUseCase: instance<DeleteTaskUseCase>(),

      )
    );
  }
}
