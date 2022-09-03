import 'package:weather_app/src/models/current_weather.dart';

class Forecast {
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentWeather currentWeather;

  Forecast({
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeather,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      timezone: json['time'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation'],
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
    );
  }
}
