import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Api {
  static HttpLink httplink =
      HttpLink('https://api.chargetrip.io/graphql', defaultHeaders: {
    "x-client-id": "629b3841cd5a29ea14695f69",
  });

  static Link link = httplink;

  static String getStations = """
query station(\$stationId: ID!) {
  station(id: \$stationId) {
    id
    country_code
    name
    address
    city
    postal_code
    country
    coordinates {
      latitude
      longitude
    }
    
    parking_type
    evses {
      uid
      evse_id
      status
      status_schedule {
        period_begin
        period_end
        status
      }
      capabilities
      connectors {
        id
        standard
        format
        power_type
        max_voltage
        max_amperage
        max_electric_power
        power
        tariff_ids
        terms_and_conditions
        last_updated
        properties
      }
      floor_level
      coordinates {
        latitude
        longitude
      }
      physical_reference
      parking_restrictions
      images {
        url
        thumbnail
        category
        type
        width
        height
      }
      last_updated
      parking_cost
      properties
    }
    directions {
      language
      text
    }
    operator {
      id
      external_id
      name
      website
      logo {
        url
        thumbnail
        category
        type
        width
        height
      }
      country
      contact {
        phone
        email
        website
        facebook
        twitter
        properties
      }
    }
    suboperator {
      id
      name
    }
    owner {
      id
      name
    }
    facilities
    time_zone
    opening_times {
      twentyfourseven
      regular_hours {
        weekday
        period_begin
        period_end
      }
      exceptional_openings {
        period_begin
        period_end
      }
      exceptional_closings {
        period_begin
        period_end
      }
    }
    charging_when_closed
    images {
      url
      thumbnail
      category
      type
      width
      height
    }
    last_updated
    location {
      type
      coordinates
    }
    elevation
    chargers {
      standard
      power
      price
      speed
      status {
        free
        busy
        unknown
        error
      }
      total
    }
    physical_address {
      continent
      country
      county
      city
      street
      number
      postalCode
      what3Words
      formattedAddress
    }
    amenities
    properties
    realtime
    power
    speed
    status
    review {
      rating
      count
    }
  }
}
""";

  static String getStationList = """query stationList {
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

  static String getStationAroundPoint =
      """ query stationAround (\$Lat: Float! , \$Long: Float!) {
  stationAround(
    query: {
      location: { type: Point, coordinates: [\$Lat, \$Long] }
      distance: 5000
      
    }
    size: 20
  ) {
    id
    external_id
    name
    address
    country
    country_code
    location {
      type
      coordinates
    }
    evses{
      uid
      status
      connectors{
        standard
        power
        
      }
      
    }
    chargers{
      price
      standard
    }
    time_zone
    opening_times{
      twentyfourseven
      regular_hours{
        period_begin
        period_end
      }
    }

    custom_properties{
      access_type
    }
  }


 
}
   """;

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
