import 'package:flutter/material.dart';
import 'package:task_manager_and_weather/data/models/weather_data.dart';
import 'package:task_manager_and_weather/resources/AppTextStyle.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherData? data;

  const WeatherWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.lightBlueAccent)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Text(
                  "температура : ${data?.main.temp ?? ''}",
                  style: AppTextStyles.h2,
                ),
                Text(
                  "відчуважться як : ${data?.main.feelsLike ?? ''}",
                  style: AppTextStyles.h2,
                ),
                const SizedBox(height: 15),
                Text(
                  "атмосферний тиск : ${data?.main.pressure ?? ''}",
                  style: AppTextStyles.h2,
                ),
              ],
            ),
            const Icon(Icons.cloud), // todo icon from api
          ],
        ));
  }
}
