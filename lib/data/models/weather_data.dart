
import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

class WeatherData { // in the case of functionality expansion this class is better to use as main for all other
  final Main main;

  WeatherData({
    required this.main,
  });

}

@JsonSerializable()
class Main { // class with @JsonSerializable generates FromJson and To Json functions, for better and faster work with http request
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

