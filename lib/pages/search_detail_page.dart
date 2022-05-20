import 'dart:typed_data';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:the_green_whale/model/data_box_model.dart';
import 'package:the_green_whale/pages/map_page.dart';
import 'package:the_green_whale/pages/reserve_spot.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';
import 'package:the_green_whale/widgets/search_detail_page_widgets/time_box.dart';

import '../widgets/home_page_widgets/my_app_bar_icon.dart';
import '../widgets/search_detail_page_widgets/type_box.dart';

class SearchDetailPage extends StatefulWidget {
  const SearchDetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final DataBoxModel data;

  @override
  State<SearchDetailPage> createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<SearchDetailPage> {
  bool isLoading = true;
  late BitmapDescriptor myIcon;
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  @override
  void initState() {
    () async {
      ByteData byteData = await DefaultAssetBundle.of(context)
          .load("assets/icons/stationMarker.png");
      Uint8List imageData = byteData.buffer.asUint8List();
      myIcon = BitmapDescriptor.fromBytes(imageData);

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }();

    super.initState();
  }

  String imgPath = "assets/icons/arrow-down-small.png";
  Set<Marker> marker = {};
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double textFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        // leadingWidth: 60,
        leading: Container(
          margin: EdgeInsets.only(
            top: size.height * 0.01,
            bottom: size.height * 0.003,
          ),
          child: MyAppBarIcon(
            size: size,
            imgSrc: "back",
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.all(size.height * 0.007),
            child: MyAppBarIcon(
              imgSrc: "heart",
              size: size,
              ontap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      fav.contains(widget.data)
                          ? "Already In Favorites"
                          : "Added to Favourites",
                      style: titleTextStyle.copyWith(color: subtitleColor),
                    ),
                    backgroundColor: primaryColor,
                    duration: const Duration(milliseconds: 500),
                  ),
                );
                fav.add(widget.data);
              },
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: greenColor,
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    // Map
                    SizedBox(
                      height: 180,
                      width: size.width,
                      child: Stack(
                        children: [
                          GoogleMap(
                            zoomControlsEnabled: false,
                            zoomGesturesEnabled: false,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(MapPage.lat, MapPage.long),
                              zoom: 15,
                            ),
                            onTap: (position) {
                              customInfoWindowController.hideInfoWindow!();
                            },
                            onCameraMove: (position) {
                              customInfoWindowController.onCameraMove!();
                            },
                            onMapCreated: (controller) async {
                              customInfoWindowController.googleMapController =
                                  controller;
                              setState(() {
                                marker.add(Marker(
                                  markerId: const MarkerId("Station Loc"),
                                  icon: myIcon,
                                  position: LatLng(MapPage.lat, MapPage.long),
                                ));

                                setState(() {});
                              });
                            },
                            markers: marker,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.017,
                        vertical: size.height * 0.02,
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.stationName,
                              style: titleTextStyle.copyWith(
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .fontSize! +
                                    10,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              widget.data.stationLocation,
                              style: subtitleTextStyle.copyWith(
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .fontSize! +
                                    5,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TimeBox(
                                  size: size,
                                  textFactor: textFactor,
                                  imgSrc: "clock",
                                  status: "Open",
                                  title: "24 h",
                                ),
                                TimeBox(
                                  size: size,
                                  textFactor: textFactor,
                                  imgSrc: "location",
                                  status: "Far",
                                  title: "24 km",
                                ),
                                TimeBox(
                                  size: size,
                                  textFactor: textFactor,
                                  imgSrc: "public",
                                  status: "Far",
                                  title: "Public",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            Text(
                              "Charging Plugs",
                              style: titleTextStyle.copyWith(
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .fontSize! +
                                    10,
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              "Pick One To Start Charging",
                              style: subtitleTextStyle.copyWith(
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .fontSize! +
                                    5,
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TypeBox(
                              size: size,
                              textFactor: textFactor,
                              isAvailable: true,
                            ),
                            TypeBox(
                              size: size,
                              textFactor: textFactor,
                              isAvailable: true,
                            ),
                            TypeBox(
                              size: size,
                              textFactor: textFactor,
                              isAvailable: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ReserveSpotPage(data: widget.data),
                        ),
                      ),
                      child: Text(
                        "Reserve Spot",
                        style: titleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
