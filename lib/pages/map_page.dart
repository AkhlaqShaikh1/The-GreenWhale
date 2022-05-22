import 'dart:async';
import 'dart:typed_data';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import 'package:the_green_whale/widgets/home_page_widgets/my_app_bar.dart';

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
      BitmapDescriptor myIcon = BitmapDescriptor.fromBytes(imageData);
      markers = {
        Marker(
          markerId: const MarkerId("firstMarker"),
          icon: myIcon,
          position: LatLng(MapPage.lat, MapPage.long),
          onTap: () {
            customInfoWindowController.addInfoWindow!(
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Karachi",
                              style: titleTextStyle,
                            ),
                            Text(
                              "Type 3c",
                              style: subtitleTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                LatLng(MapPage.lat, MapPage.long));
          },
        ),
      };

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
    controller.dispose();
    customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFactor = MediaQuery.of(context).textScaleFactor;
    // CameraPosition cam2 = CameraPosition(target: LatLng(getLat(), getLong()));

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                : SizedBox(
                    // height: size.height * 0.5,
                    width: size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.loose,
                      children: [
                        SizedBox(
                          height: size.height * 0.75,
                          width: size.width,
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: greenColor,
                                )
                              : GoogleMap(
                                  initialCameraPosition: const CameraPosition(
                                      target: LatLng(24.946218, 67.005615),
                                      zoom: 13),
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
                                    // getLat();
                                    // getLong();
                                  },
                                  myLocationEnabled: false,
                                  zoomControlsEnabled: false,

                                  markers: markers,
                                  // markers: {},
                                ),
                        ),
                        CustomInfoWindow(
                          controller: customInfoWindowController,
                          offset: size.height * 0.08,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                                MapPage.lat, MapPage.long),
                                            zoom: 20,
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
                  )
          ],
        ),
      ),
    );
  }
}
