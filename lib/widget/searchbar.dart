import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final Function? onEditingComplete;

  const SearchBar(
      {Key? key,
      this.controller,
      this.onChanged,
      this.onSubmit,
      this.onEditingComplete})
      : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) => Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        height: 48,
        width: sizingInfo.screenSize.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextFormField(
          cursorWidth: 1,
          cursorColor: Theme.of(context).primaryColor,
          autofocus: false,
          controller: widget.controller,
          style: TextStyle(
            color: Color(
              0xff79859a,
            ),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Rubik",
          ),
          onFieldSubmitted: widget.onSubmit,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              hintText: "Search by order id or AWB no.",
              hintStyle: TextStyle(
                color: Color(
                  0xff79859a,
                ),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Rubik",
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              prefixIcon: Container(
                padding: EdgeInsets.all(15),
                child: Image.asset(
                  "assets/icons/search.png",
                  width: 16,
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
