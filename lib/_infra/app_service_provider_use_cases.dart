import 'package:get_it/get_it.dart';
import 'package:task_manager_and_weather/domain/repositories/weather_repository.dart';
import 'package:task_manager_and_weather/domain/use_cases/get_current_weather_use_case.dart';

class AppServiceLocatorUseCases {
  static Future<void> setup({required GetIt instance}) async {
    instance.registerFactory<GetCurrentWeatherUseCase>( // get weather use case get it instance
            () => GetCurrentWeatherUseCase(
          weatherRepository: instance<WeatherRepository>(),
        )
    );
  }
}