import 'package:flutter/material.dart';
import 'package:task_manager_and_weather/_infra/app_service_locator.dart';
import 'package:task_manager_and_weather/presentation/app/task_weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServiceLocator.setup();

  runApp(const MaterialApp(home: TaskWeatherApp()));
}

