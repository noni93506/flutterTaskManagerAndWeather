class EnvironmentKeys {
  late final String weatherApi;


  EnvironmentKeys._({
    required this.weatherApi,
  });

  factory EnvironmentKeys.initial() {
    return EnvironmentKeys._(
      weatherApi: "https://api.openweathermap.org/data/2.5/weather?lat=49.4229&lon=26.9871&appid=90c51be69b2dfafeadb33154e369505b&units=metric&lang=ua",
    );
  }
}