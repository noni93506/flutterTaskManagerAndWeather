
import 'package:bloc/bloc.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherCubit> {

  WeatherCubit(): super(WeatherState.initial());


}
