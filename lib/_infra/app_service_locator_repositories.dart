import 'package:get_it/get_it.dart';
import 'package:task_manager_and_weather/data/models/database/storage/database_manager.dart';
import 'package:task_manager_and_weather/data/repositories/task_repository.dart';
import 'package:task_manager_and_weather/data/repositories/weather_repository.dart';
import 'package:task_manager_and_weather/domain/repositories/task_repository.dart';
import 'package:task_manager_and_weather/domain/repositories/weather_repository.dart';

/// all [Repository] dependency init
class AppServiceLocatorRepositories {
  static Future<void> setup({required GetIt instance}) async {
    instance.registerLazySingleton<WeatherRepository>(
        // get weather repository get it instance
        () => WeatherRepositoryImpl());
    // tasks repository get it instance
    instance.registerLazySingleton<TaskRepository>(
        () => TaskRepositoryImpl(databaseManager: instance<DatabaseManager>()));
  }
}
