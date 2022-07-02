import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/co_ordinates.dart';

class SearchApi {
  final String cityName;
  SearchApi({
    required this.cityName,
  });
  String url =
      'http://api.positionstack.com/v1/forward?access_key=c67946424cd56797f1911680d02ad708&';

  Future<CoOrdinates> getCoOrdinates() async {
    var response = await http.get(Uri.parse(url + "query=$cityName&region=$cityName"));
    var body = jsonDecode(response.body);
    if (body['data'].isNotEmpty) {
      return CoOrdinates(
          lat: body['data'][0]['latitude'], long: body['data'][0]['longitude']);
    } else {
      throw ("City not Found");
    }
  }
}
