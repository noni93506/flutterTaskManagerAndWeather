import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager_and_weather/data/models/weather_data.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const WeatherState._();

  const factory WeatherState({
    required Exception? exception,
    required WeatherData? weather,
    required bool isLoading,
  }) = _WeatherState;

  factory WeatherState.initial() {
    return const WeatherState(
      weather: null,
      exception: null,
      isLoading: false,
    );
  }
}
