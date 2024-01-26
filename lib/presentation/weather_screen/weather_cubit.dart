
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_and_weather/data/models/weather_data.dart';
import 'package:task_manager_and_weather/domain/use_cases/get_current_weather_use_case.dart';

import 'weather_state.dart';


class WeatherCubit extends Cubit<WeatherState> {
  final GetCurrentWeatherUseCase _getWeatherUseCase;
  WeatherCubit(
  {required GetCurrentWeatherUseCase getCurrentWeatherUseCase}
      ): _getWeatherUseCase = getCurrentWeatherUseCase,
        super(WeatherState.initial()){
    _getWeather();
  }
  _getWeather() async {
    emit(state.copyWith(isLoading: true));
    WeatherData result = await _getWeatherUseCase.execute();
    emit(state.copyWith(isLoading: false, weather: result));
    Future.delayed(const Duration(seconds: 20)).then((value) => _getWeather()); // get weather every 20 seconds
  }
}
