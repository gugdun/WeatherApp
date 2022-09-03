import 'package:weather_app/src/models/coordinates.dart';
import 'package:http/http.dart' as http;

class GeocodingService {
  Future<Coordinates> getCoordinates(String city) async {
    await http.get(Uri.https(
      'geocoding-api.open-meteo.com',
      '/v1/search',
      <String, dynamic>{'name': city},
    ));
    return Coordinates.fromJson({});
  }
}
