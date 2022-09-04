import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/entities/city.dart';

class GeocodingService {
  Future<List<City>> getCoordinates(String city) async {
    Response response = await http.get(Uri.https(
      'geocoding-api.open-meteo.com',
      '/v1/search',
      <String, dynamic>{'name': city},
    ));
    try {
      var results = jsonDecode(response.body)['results'];
      return results.map<City>((e) => City.fromJson(e)).toList();
    } catch (e) {
      return <City>[];
    }
  }
}
