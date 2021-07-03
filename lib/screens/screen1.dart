import 'package:client/shared/colors.dart';
import 'package:client/widget/appbar.dart';
import 'package:client/widget/dropdown.dart';
import 'package:client/widget/roundedCard.dart';
import 'package:client/widget/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class Screen1 extends StatelessWidget {
  final bool? checkboxValue = false;
  final String? dropdownValue = 'Last 7 days';
  const Screen1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            //header
            header(context),
            checklist(),

            Container(
                height: MediaQuery.of(context).size.height - 260,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return swapable(context);
                    }))
            // list view swapable cards
          ],
        ));
  }

  Widget header(context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: greenBlockColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
        image: DecorationImage(
            image: AssetImage(
              "assets/bg.png",
            ),
            fit: BoxFit.fitWidth),
      ),
      child: Column(
        children: [
          //appbar
          AppBarCustom(
            backIcon: true,
            filterIcon: true,
          ),
          //content

          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              "Ready to Dispatch",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w400,
                fontFamily: "Gilroy-Bold",
              ),
            ),
          ),
          //searchbar
          SearchBar()
        ],
      ),
    );
  }

  Widget checklist() {
    return Container(
      // width: 100,
      padding: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
              hoverColor: greyColor,
              value: checkboxValue,
              onChanged: (v) {
                //  checkboxValue = v;
              }),
          PopupMenuButton(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(dropdownValue!), Icon(Icons.arrow_drop_down)],
              ),
            ),
            itemBuilder: (_) => <PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                  child: new Text('Today'), value: 'Today'),
              new PopupMenuItem<String>(
                  child: new Text('Yesterday'), value: 'Yesterday'),
              new PopupMenuItem<String>(
                  child: new Text('Last 7 days'), value: 'Last 7 days'),
            ],
            onSelected: (value) {},
          ),
        ],
      ),
    );
  }

  Widget card(context) {
    return RoundedCard(
      width: MediaQuery.of(context).size.width,
      height: 140,
      content: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 12,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ID',
                    style: TextStyle(color: greyColor, fontSize: 12),
                  ),
                  Text('Order Date',
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 12,
                      )),
                  PopupMenuButton(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Image.asset(
                        'assets/icons/More.png',
                        width: 16,
                      ),
                    ),
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(
                          child: new Text('Edit Profile'),
                          value: 'Edit Profile'),
                      new PopupMenuItem<String>(
                          child: new Text('Change Password'),
                          value: 'Change Password'),
                      new PopupMenuItem<String>(
                          child: new Text('Log Out'), value: 'Log Out'),
                    ],
                    onSelected: (value) {},
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('5689000'),
                  Text('8 Aug 2020 - 6:45 PM'),
                  Text('')
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/blueDart.png',
                width: 100,
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: yellowbgColor,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'pickup rescheduled'.toUpperCase(),
                        style: TextStyle(
                          color: yellowColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        child: Row(
                          children: [
                            Text(
                              '₹180',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: greyColor,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget swapable(context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: card(context),
      secondaryActions: <Widget>[
        Container(
          width: 200,

          //  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Card(
            color: blueBlockColor,
            shape: RoundedRectangleBorder(
                side: BorderSide.none, borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Track Order',
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: whiteColor,
                  ),
                  Text(
                    'Cancel ',
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
