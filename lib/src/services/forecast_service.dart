import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/entities/coordinates.dart';
import 'package:weather_app/src/entities/forecast.dart';

class ForecastService {
  Future<Forecast> currentWeather(Coordinates coordinates) async {
    Response response = await http.get(Uri.https(
      'api.open-meteo.com',
      '/v1/forecast',
      <String, dynamic>{
        'latitude': coordinates.latitude,
        'longitude': coordinates.longitude,
        'timezone': 'auto',
        'current_weather': 'true',
      },
    ));
    return Forecast.fromJson(jsonDecode(response.body));
  }
}
