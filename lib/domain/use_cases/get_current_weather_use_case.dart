import 'package:task_manager_and_weather/data/models/weather_data.dart';
import 'package:task_manager_and_weather/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherUseCase({
    required WeatherRepository weatherRepository,
  }) : _weatherRepository = weatherRepository;

  Future<WeatherData> execute() async {
    return await _weatherRepository.getWeather();
  }
}
