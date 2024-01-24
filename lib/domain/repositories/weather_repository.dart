import 'package:task_manager_and_weather/data/models/weather_data.dart';

abstract class WeatherRepository {
  Future<WeatherData> getWeather();
}