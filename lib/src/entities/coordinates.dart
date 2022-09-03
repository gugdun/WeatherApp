class Coordinates implements Comparable {
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

  @override
  int compareTo(other) {
    if (city == other?.city &&
        admin == other?.admin &&
        country == other?.country &&
        latitude == other?.latitude &&
        longitude == other?.longitude) {
      return 1;
    } else {
      return 0;
    }
  }
}
