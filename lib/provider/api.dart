import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Api {
  static HttpLink httplink =
      HttpLink('https://api.chargetrip.io/graphql', defaultHeaders: {
    "x-client-id": "6299d775cd5a29ea14695b73",
  });

  static Link link = httplink;

  static String getStations = """query stationList {
  stationList {
    id
    external_id
    country_code
    party_id
    name
    address
    city
    postal_code
    state
    country
    coordinates {
      latitude
      longitude
    }
    related_locations {
      latitude
      longitude
    }
    
  }
} """;

  static String test1 = """query carListAll {
  carList {
  id
 	naming {
      make
      model
      edition
      chargetrip_version
    }
  body {
      seats
    }
  }
}""";

  static String getStationAroundPoint =
      """ query stationAround (\$Lat : Float! , \$Long: Float!) {
  stationAround(
    query: {
     location: { type: Point, coordinates: [\$Lat,\$Long] }
      distance:1000

      
    }
    size: 10
    page: 0
  ) {
    id
    external_id
    name
    location {
      type
      coordinates
          }
      }
    } """;

  // static String getStationAroundGeo(String lat , long){

  // }

  void getStationDetails() {}

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    ),
  );
}
