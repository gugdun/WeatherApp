import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/entities/city.dart';
import 'package:weather_app/src/entities/forecast.dart';

class ForecastService {
  Future<Forecast> currentWeather(City city) async {
    Response response = await http.get(Uri.https(
      'api.open-meteo.com',
      '/v1/forecast',
      <String, dynamic>{
        'latitude': '${city.latitude}',
        'longitude': '${city.longitude}',
        'timezone': 'auto',
        'current_weather': 'true',
      },
    ));
    return Forecast.fromJson(jsonDecode(response.body));
  }
}
