import 'package:task_manager_and_weather/data/models/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather();
}