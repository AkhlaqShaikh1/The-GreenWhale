import 'dart:convert';

class DataBoxModel {
  final String stationName;
  final String stationDistance;
  final String stationTime;
  final String stationLocation;
  final String stationPower;
  final bool isAvailable;
  DataBoxModel({
    required this.stationName,
    required this.stationDistance,
    required this.stationTime,
    required this.stationLocation,
    required this.stationPower,
    required this.isAvailable,
  });

  DataBoxModel copyWith({
    String? stationName,
    String? stationDistance,
    String? stationTime,
    String? stationLocation,
    String? stationPower,
    bool? isAvailable,
  }) {
    return DataBoxModel(
      stationName: stationName ?? this.stationName,
      stationDistance: stationDistance ?? this.stationDistance,
      stationTime: stationTime ?? this.stationTime,
      stationLocation: stationLocation ?? this.stationLocation,
      stationPower: stationPower ?? this.stationPower,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'stationName': stationName});
    result.addAll({'stationDistance': stationDistance});
    result.addAll({'stationTime': stationTime});
    result.addAll({'stationLocation': stationLocation});
    result.addAll({'stationPower': stationPower});
    result.addAll({'isAvailable': isAvailable});

    return result;
  }

  factory DataBoxModel.fromMap(Map<String, dynamic> map) {
    return DataBoxModel(
      stationName: map['stationName'] ?? '',
      stationDistance: map['stationDistance'] ?? '',
      stationTime: map['stationTime'] ?? '',
      stationLocation: map['stationLocation'] ?? '',
      stationPower: map['stationPower'] ?? '',
      isAvailable: map['isAvailable'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataBoxModel.fromJson(String source) =>
      DataBoxModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DataBoxModel(stationName: $stationName, stationDistance: $stationDistance, stationTime: $stationTime, stationLocation: $stationLocation, stationPower: $stationPower, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataBoxModel &&
        other.stationName == stationName &&
        other.stationDistance == stationDistance &&
        other.stationTime == stationTime &&
        other.stationLocation == stationLocation &&
        other.stationPower == stationPower &&
        other.isAvailable == isAvailable;
  }

  @override
  int get hashCode {
    return stationName.hashCode ^
        stationDistance.hashCode ^
        stationTime.hashCode ^
        stationLocation.hashCode ^
        stationPower.hashCode ^
        isAvailable.hashCode;
  }
}

List<DataBoxModel> data = [
  DataBoxModel(
    stationName: "BMW-AUTOMAG",
    stationDistance: "1.4 km",
    stationTime: "9am - 10am",
    stationLocation: "Luebeckertordamm 60, Munich",
    stationPower: "22 kw",
    isAvailable: true,
  ),
  DataBoxModel(
    stationName: "XY",
    stationDistance: "1.4 km",
    stationTime: "9am - 10am",
    stationLocation: "Luebeckertordamm 60, Munich",
    stationPower: "22 kw",
    isAvailable: false,
  ),
  DataBoxModel(
    stationName: "HELLO",
    stationDistance: "1.4 km",
    stationTime: "9am - 10am",
    stationLocation: "Luebeckertordamm 60, Munich",
    stationPower: "22 kw",
    isAvailable: true,
  ),
];

List<DataBoxModel> fav = [];
