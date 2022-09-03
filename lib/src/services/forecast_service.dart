import 'package:http/http.dart' as http;
import 'package:weather_app/src/models/coordinates.dart';
import 'package:weather_app/src/models/forecast.dart';

class ForecastService {
  Future<Forecast> currentWeather(Coordinates coordinates) async {
    await http.get(Uri.https(
      'api.open-meteo.com',
      '/v1/forecast',
      <String, dynamic>{
        'latitude': coordinates.latitude,
        'longitude': coordinates.longitude,
        'hourly': 'temperature_2m',
      },
    ));
    return Forecast.fromJson({});
  }
}
