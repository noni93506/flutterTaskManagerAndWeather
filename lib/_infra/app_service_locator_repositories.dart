import 'package:get_it/get_it.dart';
import 'package:task_manager_and_weather/data/repositories/weather_repository.dart';
import 'package:task_manager_and_weather/domain/repositories/weather_repository.dart';

class AppServiceLocatorRepositories {
  static Future<void> setup({required GetIt instance}) async {
    instance.registerLazySingleton<WeatherRepository>( // get weather repository get it instance
        () => WeatherRepositoryImpl());
  }
}
