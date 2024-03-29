import 'dart:math' show cos, sqrt, asin;
import 'dart:typed_data';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final dynamic data;

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
                              target: LatLng(
                                  widget.data['location']['coordinates'][1],
                                  widget.data['location']['coordinates'][0]),
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
                                  markerId: MarkerId(widget.data['id']),
                                  icon: myIcon,
                                  position: LatLng(
                                    widget.data['location']['coordinates'][1],
                                    widget.data['location']['coordinates'][0],
                                  ),
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
                              widget.data['name'],
                              style: titleTextStyle.copyWith(fontSize: 50.sp),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              widget.data['address'] +
                                  ', ' +
                                  widget.data['country_code'],
                              style: subtitleTextStyle.copyWith(
                                fontSize: 35.sp,
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
                                  status: widget.data['opening_times']
                                              ['twentyfourseven'] ==
                                          true
                                      ? "Open"
                                      : "No",
                                  title: "24 h",
                                ),
                                TimeBox(
                                  size: size,
                                  textFactor: textFactor,
                                  imgSrc: "location",
                                  status: distanceFar(
                                    setDistance(
                                      MapPage.lat.toDouble(),
                                      MapPage.long.toDouble(),
                                      widget.data['location']['coordinates'][1],
                                      widget.data['location']['coordinates'][0],
                                    ),
                                  ),
                                  title: setDistance(
                                        MapPage.lat.toDouble(),
                                        MapPage.long.toDouble(),
                                        widget.data['location']['coordinates']
                                            [1],
                                        widget.data['location']['coordinates']
                                            [0],
                                      ).toString().substring(0, 7) +
                                      " km",
                                ),
                                TimeBox(
                                  size: size,
                                  textFactor: textFactor,
                                  imgSrc: "public",
                                  status: "Access",
                                  title: access(widget.data['custom_properties']
                                      ['access_type']),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            Text(
                              "Charging Plugs",
                              style: titleTextStyle.copyWith(fontSize: 60.sp),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              "Pick One To Start Charging",
                              style:
                                  subtitleTextStyle.copyWith(fontSize: 35.sp),
                            ),
                            SizedBox(height: size.height * 0.02),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.data['evses'].length,
                                itemBuilder: (context, index) {
                                  return TypeBox(
                                    size: size,
                                    textFactor: textFactor,
                                    isAvailable: widget.data['evses'][index]
                                        ['status'],
                                    connectorType: widget.data['evses'][index]
                                        ['connectors'][0]['standard'],
                                    power: widget.data['evses'][index]
                                            ['connectors'][0]['power']
                                        .toString(),
                                    price: widget.data['chargers'][0]['price']
                                            .isEmpty
                                        ? "Price Unavailable"
                                        : "",
                                  );
                                })
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

  double setDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  distanceFar(distance) {
    if (distance > 1) {
      return "Far";
    }
    return "Nearby";
  }

  access(data) {
    if (data == null || data == "Public") {
      return "Public";
    }
    if (data == "Private") {
      return "Private";
    }
    if (data == "Restricted") {
      return "Restricted";
    }

    return "N/A";
  }
}
