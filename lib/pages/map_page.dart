import 'dart:async';
import 'dart:typed_data';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import 'package:the_green_whale/widgets/home_page_widgets/my_app_bar.dart';

import '../provider/api.dart';
import '../utils/colors.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  static String id = "/map";
  static double lat = 0, long = 0;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController controller;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  bool isLoading = true;
  late BitmapDescriptor myIcon;
  Set<Marker> markers = {};

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  getLatLong() async {
    Position position = await _getGeoLocationPosition();
    MapPage.lat = position.latitude;
    MapPage.long = position.longitude;
    return;
  }

  @override
  void initState() {
    () async {
      await getLatLong();
      ByteData byteData = await DefaultAssetBundle.of(context)
          .load("assets/icons/stationMarker.png");
      Uint8List imageData = byteData.buffer.asUint8List();
      myIcon = BitmapDescriptor.fromBytes(imageData);

      // Query(
      //     options: QueryOptions(
      //         document: gql(Api.getStationAroundPoint),
      //         variables: {
      //           "Long": 9.993682,
      //           "Lat": 53.551086,
      //         }),
      //     builder: (QueryResult result,
      //         {VoidCallback? refetch, FetchMore? fetchMore}) {
      //       List? station = result.data?['stationAround'];

      //       for (int i = 0; i < station!.length; i++) {
      //         markers.add(
      //           Marker(
      //             markerId: MarkerId(station[i]['id']),
      //             icon: myIcon,
      //             position: LatLng(station[i]['coordinates'][1],
      //                 station[i]['coordinates'][0]),
      //           ),
      //         );
      //         print(
      //             "${station[i]['coordinates'][0]},${station[i]['coordinates'][1]}  ");
      //       }
      //       if (station.isEmpty) {
      //         return const Text("No Stations Around");
      //       }

      //       return Text("sta");
      //     });

      // markers = {
      //   Marker(
      //     markerId: const MarkerId("firstMarker"),
      //     icon: myIcon,
      //     position: LatLng(
      //       53.551086, // [1],
      //       9.993682, // [0]
      //     ),
      //     onTap: () {
      //       customInfoWindowController.addInfoWindow!(
      //           Column(
      //             // mainAxisSize: MainAxisSize.min,
      //             children: [
      //               Container(
      //                 height: 150.h,
      //                 width: 350.w,
      //                 alignment: Alignment.center,
      //                 decoration: BoxDecoration(
      //                   color: primaryColor,
      //                   borderRadius: BorderRadius.circular(5),
      //                 ),
      //                 child: Padding(
      //                   padding: EdgeInsets.all(8.0.sp),
      //                   child: Center(
      //                     child: Column(
      //                       children: [
      //                         Text(
      //                           "Karachi",
      //                           style: titleTextStyle,
      //                         ),
      //                         Text(
      //                           "Type 3c",
      //                           style: subtitleTextStyle,
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           LatLng(
      //             53.551086,
      //             9.993682,
      //           ));
      //     },
      //   ),
      // };

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }();

    super.initState();
  }

  @override
  void dispose() {
    // controller.dispose();
    customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          CustomAppBar(size: size, textFactor: textFactor),
          isLoading
              ? Column(
                  children: [
                    SizedBox(height: size.height * 0.3),
                    CircularProgressIndicator(
                      color: greenColor,
                      backgroundColor: backgroundColor,
                    ),
                  ],
                )
              : Stack(
                  alignment: Alignment.center,
                  // fit: StackFit.loose,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 15.sp),
                      height: 1750.h,
                      width: size.width,
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: greenColor,
                            )
                          : Query(
                              options: QueryOptions(
                                  document: gql(Api.getStationAroundPoint),
                                  variables: {
                                    "Lat": MapPage.long,
                                    "Long": MapPage.lat,
                                  }),
                              builder: (QueryResult result,
                                  {VoidCallback? refetch,
                                  FetchMore? fetchMore}) {
                                return GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      MapPage.lat,
                                      MapPage.long,
                                    ),
                                    zoom: 10,
                                  ),
                                  onTap: (position) {
                                    customInfoWindowController
                                        .hideInfoWindow!();
                                  },
                                  onCameraMove: (position) {
                                    customInfoWindowController.onCameraMove!();
                                  },
                                  onMapCreated: (gcontroller) async {
                                    customInfoWindowController
                                        .googleMapController = gcontroller;
                                    controller = gcontroller;
                                    const Duration(seconds: 1);
                                    // List? station = result.data?['station']

                                    // getLat();
                                    // getLong();
                                  },
                                  myLocationEnabled: false,
                                  zoomControlsEnabled: false,
                                  markers: getmarkers(result),
                                );
                              },
                            ),

                      // : GoogleMap(
                      //     initialCameraPosition: CameraPosition(
                      //         target: LatLng(MapPage.lat, MapPage.long),
                      //         zoom: 13),
                      //     onTap: (position) {
                      //       customInfoWindowController.hideInfoWindow!();
                      //     },
                      //     onCameraMove: (position) {
                      //       customInfoWindowController.onCameraMove!();
                      //     },
                      //     onMapCreated: (gcontroller) async {
                      //       customInfoWindowController.googleMapController =
                      //           gcontroller;
                      //       controller = gcontroller;

                      //       // getLat();
                      //       // getLong();
                      //     },
                      //     myLocationEnabled: false,
                      //     zoomControlsEnabled: false,

                      //     markers: markers,
                      //      markers: {},
                      //   ),
                    ),
                    CustomInfoWindow(
                      controller: customInfoWindowController,
                      height: 200.h,
                    ),
                    Positioned(
                      top: size.height * 0.62,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.height * 0.01,
                            vertical: size.height * 0.013,
                          ),
                          width: size.height * 0.26,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Image.asset(
                                  "assets/icons/layer.png",
                                  height: size.height * 0.029,
                                ),
                              ),
                              Container(
                                color: subtitleColor,
                                height: size.height * 0.04,
                                width: size.width * 0.003,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                      CameraPosition(
                                        target: LatLng(
                                          MapPage.lat,
                                          MapPage.long,
                                        ),
                                        zoom: 15,
                                      ),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  "assets/icons/gps.png",
                                  height: size.height * 0.029,
                                ),
                              ),
                              Container(
                                color: subtitleColor,
                                height: size.height * 0.04,
                                width: size.width * 0.003,
                              ),
                              Image.asset(
                                "assets/icons/send.png",
                                height: size.height * 0.029,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Set<Marker> getmarkers(QueryResult result) {
    List? stations = result.data?['stationAround'];
    for (int i = 0; i < stations!.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(stations[i]['id']),
          icon: myIcon,
          position: LatLng(
            stations[i]['location']['coordinates'][1],
            stations[i]['location']['coordinates'][0],
          ),
        ),
      );
    }
    return markers;
  }
}
