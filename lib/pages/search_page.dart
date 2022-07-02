import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:the_green_whale/pages/map_page.dart';
import 'package:the_green_whale/pages/search_detail_page.dart';
import 'package:the_green_whale/provider/api.dart';
import 'package:the_green_whale/provider/search_api.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';
import 'package:the_green_whale/widgets/home_page_widgets/my_app_bar_icon.dart';
import 'package:the_green_whale/widgets/search_page_widgets/data_box.dart';
import 'package:the_green_whale/widgets/search_page_widgets/my_search_box.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static String id = "/search";
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  late double cityLat;
  late double cityLong;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // upddates to me made here
  bool isLoading = false;
  getData(value) async {
    setState(() {
      isLoading = true;
    });
    try {
      var coOrdinates = await SearchApi(cityName: value).getCoOrdinates();
      cityLat = coOrdinates.lat;
      cityLong = coOrdinates.long;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      return Text(e.toString());
    }
  }

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
            top: size.height * 0.015,
          ),
          child: MyAppBarIcon(
            size: size,
            imgSrc: "back",
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          "Search",
          style: titleTextStyle.copyWith(
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.04),
            //Search Bar
            SearchBar(
              submit: () {
                setState(() {
                  getData(searchController.text);
                });
              },
              size: size,
              searchController: searchController,
              textFactor: textFactor,
              tap: () {
                setState(() {
                  FocusManager.instance.primaryFocus?.unfocus();

                  searchController.clear();
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            //Current Location Searched
            Padding(
              padding: EdgeInsets.only(left: size.height * 0.025),
              child: Text(
                "NEAR ${searchController.text.trim().toUpperCase()}",
                style: subtitleTextStyle.copyWith(fontSize: textFactor * 14),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            searchController.text.isEmpty
                ? Query(
                    options: QueryOptions(
                        document: gql(Api.getStationAroundPoint),
                        variables: {'Lat': MapPage.long, 'Long': MapPage.lat}),
                    builder: (QueryResult result,
                        {VoidCallback? refetch, FetchMore? fetchMore}) {
                      if (result.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: greenColor,
                          ),
                        );
                      }

                      List? stations = result.data?['stationAround'];

                      if (stations == null || stations.isEmpty) {
                        return const Center(
                          child: Text(
                            "No Stations Around",
                            textAlign: TextAlign.center,
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: stations.length,
                        padding: EdgeInsets.only(
                            left: size.height * 0.025,
                            right: size.height * 0.025),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = stations[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SearchDetailPage(data: item),
                                ),
                              );
                              setState(() {});
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  DataBox(
                                    size: size,
                                    stationName: item['name'],
                                    stationLocation: item['address'] +
                                        ', ' +
                                        item['country_code'],
                                    connectors: item['evses'],
                                    stationPower: item['evses'][0]['connectors']
                                        [0]['power'],
                                    stationDistance: item['location']
                                        ['coordinates'],
                                    isAvailable: "AVAILABLE",
                                    stationTime: item['opening_times']
                                        ['regular_hours'],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        shrinkWrap: true,
                      );
                    })
                : isLoading
                    ? CircularProgressIndicator(
                        color: greenColor,
                      )
                    : Query(
                        options: QueryOptions(
                            document: gql(Api.getStationAroundPoint),
                            variables: {'Lat': cityLong, 'Long': cityLat}),
                        builder: (QueryResult result,
                            {VoidCallback? refetch, FetchMore? fetchMore}) {
                          if (result.isLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: greenColor,
                              ),
                            );
                          }

                          List? stations = result.data?['stationAround'];

                          if (stations == null || stations.isEmpty) {
                            return const Center(
                              child: Text(
                                "No Stations Around",
                                textAlign: TextAlign.center,
                              ),
                            );
                          }

                          return ListView.builder(
                            itemCount: stations.length,
                            padding: EdgeInsets.only(
                                left: size.height * 0.025,
                                right: size.height * 0.025),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = stations[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SearchDetailPage(data: item),
                                    ),
                                  );
                                  setState(() {});
                                },
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      DataBox(
                                        size: size,
                                        stationName: item['name'],
                                        stationLocation: item['address'] +
                                            ', ' +
                                            item['country_code'],
                                        connectors: item['evses'],
                                        stationPower: item['evses'][0]
                                            ['connectors'][0]['power'],
                                        stationDistance: item['location']
                                            ['coordinates'],
                                        isAvailable: "AVAILABLE",
                                        stationTime: item['opening_times']
                                            ['regular_hours'],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            shrinkWrap: true,
                          );
                        }),
          ],
        ),
      ),
    );
  }
}
