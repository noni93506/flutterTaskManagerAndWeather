
import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  @JsonKey() final Main main;

  WeatherData({
    required this.main,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class Main {
  @JsonKey() final double temp;
  @JsonKey(name: "feels_like") final double feelsLike;
  @JsonKey() final int pressure;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.pressure,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
}

