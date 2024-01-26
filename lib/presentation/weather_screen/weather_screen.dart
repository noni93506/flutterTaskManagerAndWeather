import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_and_weather/_infra/app_service_locator.dart';
import 'package:task_manager_and_weather/presentation/common/app_app_bar.dart';
import 'package:task_manager_and_weather/presentation/common/weather_widget.dart';
import 'package:task_manager_and_weather/presentation/weather_screen/weather_cubit.dart';
import 'package:task_manager_and_weather/presentation/weather_screen/weather_state.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({Key? key}) : super(key: key);

  final _screenBloc = getIt<WeatherCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
        bloc: _screenBloc,
        listener: (context, state) {
          /// same as in [task_manager_screen.dart]
        },
        builder: (context, state) {
          return AppAppBar (
            body: Center(
                child: WeatherWidget(
              data: state.weather,
            )
          ),
        );
      }
    );
  }
}
