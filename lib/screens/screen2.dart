import 'package:client/shared/colors.dart';
import 'package:client/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            //header
            header(),
          ],
        ));
  }

  Widget header() {
    return Container(
      height: 200,
      decoration: BoxDecoration(),
      child: Column(
        children: [
          //appbar
          AppBarCustom(
            color: greyColor,
            backIcon: true,
            filterIcon: false,
          ),
          //content

          //searchbar
        ],
      ),
    );
  }
}
