import 'package:flutter/material.dart';
import 'package:task_manager_and_weather/presentation/common/app_button.dart';
import 'package:task_manager_and_weather/presentation/weather_screen/weather_screen.dart';

class TaskWeatherApp extends StatelessWidget{

  const TaskWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              text: "Weather",
              onPressed: (){
                _goToWeather(context);
                print("weather");
              },
            ),
            AppButton(
              text: "Task Manager",
              onPressed: (){
                print("task");
              },
            ),
          ],
        ),
      );
  }
  _goToWeather(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherScreen()));
  }
}