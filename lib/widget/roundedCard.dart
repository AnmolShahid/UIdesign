import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final Widget? content;
  final Color? cardColor;
  final double? circularRadius;
  final double? width;
  final double? height;
  final BorderSide? borderSide;
  final EdgeInsetsGeometry? margin;
  final double? elevation;

  const RoundedCard({
    Key? key,
    @required this.content,
    this.cardColor = Colors.white,
    this.circularRadius = 10.0,
    this.width,
    this.height,
    this.borderSide,
    this.margin,
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      width: width,
      height: height,
      child: Card(
          margin: margin,
          elevation: elevation,
          color: cardColor,
          shape: RoundedRectangleBorder(
              side: borderSide ?? BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          child: content),
    );
  }
}
