import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:the_green_whale/pages/search_detail_page.dart';

// import 'package:the_green_whale/provider/api.dart';
import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

import '../model/data_box_model.dart';
import '../widgets/search_page_widgets/data_box.dart';
// import 'map_page.dart';

class ReservePage extends StatelessWidget {
  const ReservePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(reserve.elementAt(0)['name']);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Reserves"),
        centerTitle: true,
        elevation: 0,
      ),
      // body: Center(
      //   child: Query(
      //     options: QueryOptions(
      //         document: gql(
      //           Api.getStationAroundPoint,
      //         ),
      //         variables: {
      //           "Lat": MapPage.long,
      //           "Long": MapPage.lat,
      //         }
      //         // this is the query string you just created
      //         ),
      //     builder: (QueryResult result,
      //         {VoidCallback? refetch, FetchMore? fetchMore}) {
      //       if (result.hasException) {
      //         return Text(result.exception.toString() +
      //             "\n${MapPage.lat} ${MapPage.long}");
      //       }

      //       if (result.isLoading) {
      //         return CircularProgressIndicator(color: greenColor);
      //       }

      //       List? stations = result.data?['stationAround'];

      //       if (stations == null) {
      //         return const Text('No Stations Nearby');
      //       }

      //       return ListView.builder(
      //           itemCount: stations.length,
      //           itemBuilder: (context, index) {
      //             return Center(
      //               child: Text(
      //                 stations[index]['location']['coordinates'][0].toString(),
      //                 style: titleTextStyle,
      //               ),
      //             );
      //           });
      //     },
      //   ),
      // ),
      body: reserve.isEmpty
          ? Center(
              child: Text(
                "No Reserves",
                style: titleTextStyle.copyWith(fontSize: 60.sp),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.height * 0.025,
                  right: size.height * 0.025,
                ),
                child: ListView.builder(
                  itemCount: reserve.length,
                  itemBuilder: (context, index) {
                    final item = reserve.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchDetailPage(data: item),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          DataBox(
                            size: size,
                            stationName: item['name'],
                            stationLocation:
                                item['address'] + " ," + item['country_code'],
                            connectors: item['evses'],
                            stationPower: item['evses'][0]['connectors'][0]
                                ['power'],
                            stationDistance: item['location']['coordinates'],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                        ],
                      ),
                    );
                  },
                  shrinkWrap: true,
                ),
              ),
            ),
    );
  }
}
