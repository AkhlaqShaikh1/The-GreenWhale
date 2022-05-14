import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_green_whale/utils/text_styles.dart';
import 'package:the_green_whale/widgets/home_page_widgets/my_app_bar.dart';

import '../utils/colors.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  static String id = "/map";

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController controller;
  double lat = 0, long = 0;

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

  // getLat() async {
  //   Position position = await _getGeoLocationPosition();
  //   lat = position.latitude;
  //   long = position.longitude;

  //   setState(() {});
  //   return lat;
  // }

  // getLong() async {
  //   Position position = await _getGeoLocationPosition();
  //   long = position.longitude;
  //   setState(() {});
  //   return long;
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFactor = MediaQuery.of(context).textScaleFactor;
    // CameraPosition cam2 = CameraPosition(target: LatLng(getLat(), getLong()));

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          CustomAppBar(size: size, textFactor: textFactor),
          SizedBox(
            // height: size.height * 0.5,
            width: size.width,
            child: Stack(
              fit: StackFit.loose,
              children: [
                SizedBox(
                  height: size.height * 0.78,
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(24.946218, 67.005615)),
                    onMapCreated: (gcontroller) {
                      controller = gcontroller;
                      // getLat();
                      // getLong();
                    },
                    myLocationEnabled: false,
                    zoomControlsEnabled: false,
                    // markers: {
                    //   Marker(
                    //       markerId: MarkerId("firstMarker"),
                    //       icon: BitmapDescriptor.defaultMarker,
                    //       position: LatLng(getLat(), getLong())),
                    // },
                    // markers: {},
                  ),
                ),
                Positioned(
                    top: size.height * 0.7,
                    left: size.width / 2.1,
                    child: Container(
                      child: TextButton(
                          child: Text("Get Current Loc"),
                          onPressed: () {
                            controller.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                                    target: LatLng(24.860966, 67.005615),
                                    zoom: 14 )));
                            setState(() {});
                          }),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
