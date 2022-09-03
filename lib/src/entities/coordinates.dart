class Coordinates {
  final String city;
  final String admin;
  final String country;
  final double latitude;
  final double longitude;

  Coordinates({
    required this.city,
    required this.admin,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      city: json['name'],
      admin: json['admin1'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
