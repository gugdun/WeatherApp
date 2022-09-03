class CurrentWeather {
  final double temperature;
  final double windSpeed;
  final double windDirection;
  final double weatherCode;
  final DateTime time;

  CurrentWeather({
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
    required this.weatherCode,
    required this.time,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temperature: json['temperature'],
      windSpeed: json['windspeed'],
      windDirection: json['winddirection'],
      weatherCode: json['weathercode'],
      time: DateTime.parse(json['time']),
    );
  }
}
