import 'package:task_manager_and_weather/_infra/api_keys.dart';
import 'package:task_manager_and_weather/data/models/weather_data.dart';
import 'package:task_manager_and_weather/domain/repositories/weather_repository.dart';
import 'package:dio/dio.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  @override
  Future<WeatherData> getWeather() async {
    try {
      final response =
           await Dio().get(EnvironmentKeys.initial().weatherApi);
      return WeatherData(main: Main.fromJson(response.data["main"]));
    } catch (exception) {
      print(exception);
      return WeatherData( // todo remove when error handler is ready
          main:
              Main(temp: 0000, feelsLike: 0000, pressure: 0000),
      );

      // throw .exceptionsHandler
      //     .mapApiException(exception: exception); // todo implement exception handler
    }
  }
}
