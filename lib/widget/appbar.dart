import 'package:client/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCustom extends StatelessWidget {
  final backIcon;
  final filterIcon;
  final color;
  const AppBarCustom(
      {Key? key, bool? this.backIcon, bool? this.filterIcon, Color? this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: color == greyColor ? whiteColor : greenBlockColor,
      padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (backIcon)
            InkWell(
              child: Image.asset(
                "assets/icons/back.png",
                width: 16,
                color: color,
              ),
              onTap: () {
                Get.back();
              },
            ),
          if (color == greyColor)
            Center(
              child: Text('Timeline'),
            ),
          if (color == greyColor)
            Center(
              child: Text(''),
            ),
          if (filterIcon)
            InkWell(
              child: Image.asset(
                "assets/icons/filter.png",
                width: 16,
              ),
              onTap: () {
                Get.defaultDialog(title: 'Filter icon clicked!');
              },
            )
        ],
      ),
    );
  }
}
