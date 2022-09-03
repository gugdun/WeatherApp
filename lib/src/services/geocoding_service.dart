import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/entities/coordinates.dart';

class GeocodingService {
  Future<List<Coordinates>> getCoordinates(String city) async {
    Response response = await http.get(Uri.https(
      'geocoding-api.open-meteo.com',
      '/v1/search',
      <String, dynamic>{'name': city},
    ));
    try {
      var results = jsonDecode(response.body)['results'];
      return results.map<Coordinates>((e) => Coordinates.fromJson(e)).toList();
    } catch (e) {
      return <Coordinates>[];
    }
  }
}
