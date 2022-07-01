class CityData {
  List<Data>? data;

  CityData({this.data});

  CityData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  double? latitude;
  double? longitude;
  String? type;
  String? name;
  Null? number;
  Null? postalCode;
  Null? street;
  int? confidence;
  String? region;
  String? regionCode;
  String? county;
  String? locality;
  String? administrativeArea;
  Null? neighbourhood;
  String? country;
  String? countryCode;
  String? continent;
  String? label;

  Data(
      {this.latitude,
      this.longitude,
      this.type,
      this.name,
      this.number,
      this.postalCode,
      this.street,
      this.confidence,
      this.region,
      this.regionCode,
      this.county,
      this.locality,
      this.administrativeArea,
      this.neighbourhood,
      this.country,
      this.countryCode,
      this.continent,
      this.label});

  Data.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    type = json['type'];
    name = json['name'];
    number = json['number'];
    postalCode = json['postal_code'];
    street = json['street'];
    confidence = json['confidence'];
    region = json['region'];
    regionCode = json['region_code'];
    county = json['county'];
    locality = json['locality'];
    administrativeArea = json['administrative_area'];
    neighbourhood = json['neighbourhood'];
    country = json['country'];
    countryCode = json['country_code'];
    continent = json['continent'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['type'] = type;
    data['name'] = name;
    data['number'] = number;
    data['postal_code'] = postalCode;
    data['street'] = street;
    data['confidence'] = confidence;
    data['region'] = region;
    data['region_code'] = regionCode;
    data['county'] = county;
    data['locality'] = locality;
    data['administrative_area'] = administrativeArea;
    data['neighbourhood'] = neighbourhood;
    data['country'] = country;
    data['country_code'] = countryCode;
    data['continent'] = continent;
    data['label'] = label;
    return data;
  }
}
