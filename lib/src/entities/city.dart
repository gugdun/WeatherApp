class City implements Comparable {
  final String city;
  final String admin;
  final String country;
  final double latitude;
  final double longitude;

  City({
    required this.city,
    required this.admin,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      city: json['name'],
      admin: json['admin1'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': city,
        'admin1': admin,
        'country': country,
        'latitude': latitude,
        'longitude': longitude,
      };

  @override
  int compareTo(other) {
    if (city == other.city &&
        admin == other.admin &&
        country == other.country &&
        latitude == other.latitude &&
        longitude == other.longitude) {
      return 1;
    } else {
      return 0;
    }
  }
}
