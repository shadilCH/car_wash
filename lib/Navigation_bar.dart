import 'package:car_wash/booking_page.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/profile_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'home_page.dart';
import 'main.dart';


class navigationPage extends StatefulWidget {
  const navigationPage({super.key});

  @override
  State<navigationPage> createState() => _navigationPageState();
}

class _navigationPageState extends State<navigationPage> {
  int selectindex=0;
  List pages=[
    homePage(),
    bookingPage(),
    profilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[
        selectindex
      ],
      bottomNavigationBar: ConvexAppBar(
        height: width*0.15,
        color: colorPage.primerycolor,
        backgroundColor: colorPage.secondarycolor,
        activeColor: colorPage.primerycolor,
        initialActiveIndex: selectindex,
        onTap: (value) {
          selectindex=value!;
          setState(() {

          });
        },

        items: [
          TabItem(
              icon: Icon(Icons.home_filled,color: colorPage.primerycolor),
              activeIcon: Icon(Icons.home_filled,color: colorPage.secondarycolor),
              title: "Home",
          ),
          TabItem(
              icon: Icon(Icons.verified_outlined,color: colorPage.primerycolor),
            activeIcon: Icon(Icons.verified_outlined,color: colorPage.secondarycolor),
              title: "Booked",
          ),
          TabItem(
              icon: Icon(Icons.person,color: colorPage.primerycolor),
            activeIcon: Icon(Icons.person,color: colorPage.secondarycolor),

              title: "Profile",
          ),
        ],
      ),
    );
  }
}
