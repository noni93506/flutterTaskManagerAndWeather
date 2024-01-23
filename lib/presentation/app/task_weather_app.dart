import 'package:flutter/material.dart';
import 'package:task_manager_and_weather/presentation/common/app_button.dart';

class TaskWeatherApp extends StatelessWidget{

  const TaskWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              text: "Weather",
              onPressed: (){
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
      ),
    );
  }

}