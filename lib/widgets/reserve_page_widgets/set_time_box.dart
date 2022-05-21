import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/data_box_model.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class SetTimeBox extends StatefulWidget {
  const SetTimeBox({
    Key? key,
    required this.size,
    this.data,
  }) : super(key: key);

  final Size size;
  final DataBoxModel? data;

  @override
  State<SetTimeBox> createState() => _SetTimeBoxState();
}

class _SetTimeBoxState extends State<SetTimeBox> {
  DateTime _chosen = DateTime.now();
  String format = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _buildModalSheet(context);
      },
      child: Container(
        width: widget.size.width,
        padding: EdgeInsets.symmetric(
          horizontal: widget.size.height * 0.02,
          vertical: widget.size.height * 0.015,
        ),
        color: boxColor,
        child: Row(
          children: [
            Text(
              format,
              style: titleTextStyle.copyWith(
                fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Image.asset(
              "assets/icons/clock.png",
              height: widget.size.height * 0.02,
              color: greenColor,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _buildModalSheet(BuildContext context) {
    return showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (_) {
          return Container(
            color: Colors.white,
            width: widget.size.width,
            height: widget.size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.size.height * 0.02,
                        vertical: widget.size.height * 0.02,
                      ),
                      child: Text(
                        "Peak Time",
                        style: titleTextStyle.copyWith(
                            color: primaryColor,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontSize),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: const Color(0xff797b7f).withOpacity(0.2),
                ),
                SizedBox(
                  height: widget.size.height * 0.3,
                  child: CupertinoDatePicker(
                      backgroundColor: Colors.white,
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: DateTime.now(),
                      use24hFormat: true,
                      onDateTimeChanged: (value) {
                        _chosen = value;
                        setState(() {
                          format = DateFormat.Hm().format(_chosen);
                        });
                      }),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: widget.size.height * 0.1,
                    color: greenColor,
                    width: widget.size.width,
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: titleTextStyle.copyWith(
                          fontSize:
                              Theme.of(context).textTheme.headline5!.fontSize,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
