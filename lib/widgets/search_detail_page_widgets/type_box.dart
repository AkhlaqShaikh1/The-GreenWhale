import 'package:flutter/material.dart';

import 'package:the_green_whale/utils/colors.dart';
import 'package:the_green_whale/utils/text_styles.dart';

class TypeBox extends StatelessWidget {
  const TypeBox({
    Key? key,
    required this.size,
    required this.textFactor,
    required this.isAvailable,
  }) : super(key: key);

  final Size size;
  final double textFactor;

  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    String available = "Available", notAvailble = "Not Available";
    return Container(
      width: size.width,
      // // color: boxColor,
      padding: EdgeInsets.symmetric(
          horizontal: size.height * 0.001, vertical: size.height * 0.01),
      child: ExpansionPanelList.radio(
        expandedHeaderPadding: EdgeInsets.zero,
        dividerColor: primaryColor,
        animationDuration: const Duration(seconds: 1),
        elevation: 0,
        children: [
          ExpansionPanelRadio(
            backgroundColor: boxColor,
            value: "",
            headerBuilder: (context, isOpen) {
              return ListTile(
                leading: Image.asset(
                  "assets/icons/type-1.png",
                  height: size.height * 0.05,
                ),
                title: Text(
                  "Type-1",
                  style: titleTextStyle.copyWith(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      "22 kw",
                      style: subtitleTextStyle,
                    ),
                    SizedBox(
                      width: size.height * 0.02,
                    ),
                    Container(
                      color: isAvailable ? greenColor : notAvailableColor,
                      height: size.height * 0.01,
                      width: size.height * 0.01,
                    ),
                    SizedBox(width: size.height * 0.007),
                    Text(
                      isAvailable ? available : notAvailble,
                      style: titleTextStyle.copyWith(
                        color: isAvailable ? greenColor : notAvailableColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
            body: isAvailable
                ? Column(
                    children: [
                      Divider(
                        color: primaryColor,
                        thickness: 2,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.height * 0.025,
                          vertical: size.height * 0.02,
                        ),
                        width: size.width,
                        child: Row(children: [
                          Text(
                            "Price",
                            style: subtitleTextStyle.copyWith(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize),
                          ),
                          const Spacer(),
                          Text(
                            "\$ 15",
                            style: titleTextStyle.copyWith(
                                color: isAvailable
                                    ? greenColor
                                    : notAvailableColor,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize),
                          )
                        ]),
                      ),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
