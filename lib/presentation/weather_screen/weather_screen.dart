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
          // if (state.isLoading) {
          //   context.showLoading();
          // } else {
          //   context.hideLoading();
          // }
          // if (state.profileException != null) {
          //   context.showErrorException(state.profileException);
          // }
          // here can be implemented simple loader callback and snack bar for error handler
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
