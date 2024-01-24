import 'package:get_it/get_it.dart';
import 'package:task_manager_and_weather/domain/use_cases/get_current_weather_use_case.dart';
import 'package:task_manager_and_weather/presentation/weather_screen/weather_cubit.dart';

class AppServiceLocatorBlocs {
  static Future<void> setup({required GetIt instance}) async {
    instance.registerFactory<WeatherCubit>(() => // Weather screen bloc get it instance
        WeatherCubit (
        getCurrentWeatherUseCase: instance<GetCurrentWeatherUseCase>(),
        ),
    );
  }
}
