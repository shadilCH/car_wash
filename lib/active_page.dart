import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/material.dart';

import 'details_page.dart';
import 'main.dart';

class activePage extends StatefulWidget {
  const activePage({super.key});

  @override
  State<activePage> createState() => _activePageState();
}

class _activePageState extends State<activePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: colorPage.secondarycolor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: colorPage.primerycolor)),
        title: Text("Active request",style:
        TextStyle(
            color: colorPage.primerycolor,
            fontSize: width*0.06,
            fontWeight: FontWeight.w700
        )
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: width*0.05,left: width*0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: width*0.03
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => detailsPage()));
              },
              child: Container(
                height: width * 0.32,
                width: width * 1,
                decoration: BoxDecoration(
                  color: colorPage.secondarycolor,
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Container(
                      height: width * 0.25,
                      width: width * 0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.03)),
                      child: Image.asset(
                        imagePage.picture1,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Prowash",
                              style: TextStyle(
                                  color: colorPage.primerycolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.045),
                            ),
                            Text("NAVANEEY",
                                style:TextStyle(
                                  color: colorPage.color6,
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.04,
                                  height: Checkbox.width * 0.056,
                                )),
                            Text("Car-M5\nKL SG 4357\n26/03/2022",
                                style:TextStyle(
                                  color: colorPage.color2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.04,
                                  height: Checkbox.width * 0.056,
                                )),
                          ],
                        ),
                        SizedBox(width: width*0.3),
                        Icon(Icons.navigate_next,color:colorPage.color1,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: width*0.03,
            ),
            Text(
              "Updations",
              style: TextStyle(
                fontSize: width * 0.058,
                fontWeight: FontWeight.w700,
                color: colorPage.primerycolor,
              ),
            ),

          ],
        ),
      ),

    );
  }
}
