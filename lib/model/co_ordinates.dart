class CoOrdinates {
  final dynamic lat;
  final dynamic long;
  CoOrdinates({
    required this.lat,
    required this.long,
  });

  factory CoOrdinates.fromJson(Map<String, dynamic> json) {
    return CoOrdinates(lat: json['latitude'], long: json['latitude']);
  }

  
}
