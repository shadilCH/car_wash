import 'package:car_wash/active_page.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/details_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class bookingPage extends StatefulWidget {
  const bookingPage({super.key});

  @override
  State<bookingPage> createState() => _bookingPageState();
}

class _bookingPageState extends State<bookingPage> {
  List booking=[
    {
      "image" : imagePage.car1,
      "title" : "Custom wash",
      "subtitle" : "Car- ShiftM5\nKL-10 AB 4357\n01/04/2022",
      "date" : "Expected on  04/04/2022"
    },
    {
      "image" : imagePage.car2,
      "title" : "Quick wash",
      "subtitle" : "Car-M5\nKL-53 SG 4357\n26/03/2022",
      "date" : "Expected on  04/04/2022",
    },
  ];
  List serviced=[
    {
      "image" : imagePage.car1,
      "title" : "Custom wash",
      "subtitle" : "Car- ShiftM5\nKL-10 AB 4357\n26/03/2022",
    },
    {
      "image" : imagePage.picture1,
      "title" : "Prowash",
      "subtitle" : "Car-M5\nKL-53 SG 4357\n26/03/2022",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondarycolor,
        title: Text("Bookings",style:
            GoogleFonts.muktaVaani(
              color: colorPage.primerycolor,
              fontSize: width*0.06,
              fontWeight: FontWeight.w700
            )
          ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width*0.05,right: width*0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: width*0.14,
                width: width*1,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width*0.02),
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                      ),
                    ),
                    hintText: "Search service",
                    hintStyle: TextStyle(

                        fontSize: width*0.05,color: colorPage.color2
                    ),
                    suffixIcon: Icon(Icons.search,color: colorPage.primerycolor,),

                  ),
                ),
              ),
              SizedBox(
                height: width*0.03,
              ),
              Text("Currently actived",style:
              GoogleFonts.muktaVaani(
                color: colorPage.primerycolor,
                fontSize: width*0.06,
                fontWeight: FontWeight.w600,
              )
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => activePage(),));
                },
                child: Container(
                  height: width*0.32,
                  width: width*1,
                  decoration: BoxDecoration(
                    color: colorPage.secondarycolor,
                    borderRadius: BorderRadius.circular(width*0.03),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width*0.03,
                      ),
                      Container(
                        height: width*0.25,
                        width: width*0.23,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.03)
                        ),
                        child: Image.asset(imagePage.picture1,fit: BoxFit.fill,),
                      ),
                      SizedBox(
                        width: width*0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Prowash",style:
                          GoogleFonts.muktaVaani(
                              color: colorPage.primerycolor,
                              fontWeight: FontWeight.w600,
                              fontSize: width*0.045
                          )
                            ,),
                          Text("Car-M5\nKL SG 4357\n26/03/2022",
                              style:
                              GoogleFonts.muktaVaani(
                                color: colorPage.color2,
                                fontWeight: FontWeight.w500,
                                fontSize: width*0.04,
                                height: Checkbox.width*0.056,
                              )),
                          Row(
                            children: [
                              Text("-----"),
                              SvgPicture.asset(imagePage.picture2,width: width*0.03),
                              SizedBox(width: width*0.01,),
                              Text("Vehicle reached at center",style:
                              GoogleFonts.muktaVaani(
                                color: colorPage.primerycolor,
                                fontWeight: FontWeight.w600,
                                fontSize: width*0.035,

                              ),)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text("Bookings",style:
              GoogleFonts.muktaVaani(
                color: colorPage.primerycolor,
                fontWeight: FontWeight.w600,
                fontSize: width*0.06,
              ),),
              Container(
                height: width*0.7,
                width: width*1,
                child: ListView.separated(
                  itemCount: booking.length,
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => detailsPage(),));
                    },
                    child: Container(
                      height: width*0.32,
                      width: width*1,
                      decoration: BoxDecoration(
                        color: colorPage.secondarycolor,
                        borderRadius: BorderRadius.circular(width*0.03),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width*0.03,
                          ),
                          Container(
                            height: width*0.25,
                            width: width*0.23,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width*0.03)
                            ),
                            child: Image.asset(booking[index]["image"],fit: BoxFit.fill,),
                          ),
                          SizedBox(
                            width: width*0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(booking[index]["title"],style:
                              GoogleFonts.muktaVaani(
                                  color: colorPage.primerycolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width*0.045
                              )
                                ,),
                              Text(booking[index]["subtitle"],
                                  style:
                                  GoogleFonts.muktaVaani(
                                    color: colorPage.color2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: width*0.04,
                                    height: Checkbox.width*0.056,
                                  )),
                              Text(booking[index]["date"],style:
                              GoogleFonts.muktaVaani(
                                color: colorPage.primerycolor,
                                fontWeight: FontWeight.w600,
                                fontSize: width*0.035,

                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: width*0.03,
                    );
                },),
              ),
              Text("Serviced",style:
              GoogleFonts.muktaVaani(
                color: colorPage.primerycolor,
                fontWeight: FontWeight.w600,
                fontSize: width*0.06,
              ),),
              Container(
                height: width*0.7,
                width: width*1,
                child: ListView.separated(
                  itemCount: booking.length,
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => activePage(),));
                      },
                      child: Container(
                        height: width*0.32,
                        width: width*1,
                        decoration: BoxDecoration(
                          color: colorPage.secondarycolor,
                          borderRadius: BorderRadius.circular(width*0.03),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width*0.03,
                            ),
                            Container(
                              height: width*0.25,
                              width: width*0.23,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(width*0.03)
                              ),
                              child: Image.asset(serviced[index]["image"],fit: BoxFit.fill,),
                            ),
                            SizedBox(
                              width: width*0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(serviced[index]["title"],style:
                                GoogleFonts.muktaVaani(
                                    color: colorPage.primerycolor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.045
                                )
                                  ,),
                                Text(serviced[index]["subtitle"],
                                    style:
                                    GoogleFonts.muktaVaani(
                                      color: colorPage.color2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width*0.04,
                                      height: Checkbox.width*0.056,
                                    )),
                                Row(
                                  children: [
                                    Text("-----"),
                                    SvgPicture.asset(imagePage.picture2,width: width*0.03),
                                    SizedBox(width: width*0.01,),
                                    Text("Vehicle reached at center",style:
                                    GoogleFonts.muktaVaani(
                                      color: colorPage.primerycolor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: width*0.035,

                                    ),)
                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: width*0.03,
                  );
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
