import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'Navigation_bar.dart';
import 'home_page.dart';
import 'main.dart';

class locationPage extends StatefulWidget {
  const locationPage({super.key});

  @override
  State<locationPage> createState() => _locationPageState();
}

class _locationPageState extends State<locationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: width*0.25,
          ),
          Text("We want your \n location",textAlign: TextAlign.center,style:
          GoogleFonts.muktaVaani(
            fontSize: width*0.08,
            fontWeight: FontWeight.w700,
            color: colorPage.primerycolor,
          )),
          SizedBox(
            height: width*0.15,
          ),
          Container(
            height: width*0.5,
            width: width*1,
            child: Image.asset(imagePage.location1),
          ),
          SizedBox(
            height: width*0.04,
          ),
          Text("We make yours shine, enable your \n location to make it easy",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: width*0.05,color: colorPage.primerycolor),),
          SizedBox(
            height: width*0.2,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(context: context,
                  backgroundColor: colorPage.secondarycolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight:Radius.circular(width*0.05),
                      topLeft: Radius.circular(width*0.05),
                    )),
                  builder: (context) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(imagePage.lottie,height: width*0.4,width: width*0.4),
                      Text("Location saved",textAlign: TextAlign.center,style:
                      GoogleFonts.muktaVaani(
                        fontSize: width*0.08,
                        fontWeight: FontWeight.w700,
                        color: colorPage.primerycolor,
                      )),
                    ],
                  ),
                );
                  },
              );
            },
            child: Container(
              height: width*0.15,
              width: width*0.45,
              decoration: BoxDecoration(
                color: colorPage.primerycolor,
                borderRadius: BorderRadius.circular(width*0.2),
              ),
              child: Center(
                child: Text("Enable",style:
                GoogleFonts.muktaVaani(
                  fontSize: width*0.06,
                  color: colorPage.secondarycolor,
                  fontWeight: FontWeight.w700,
                ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: width*0.03,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => navigationPage(),));
            },
            child: Container(
              height: width*0.15,
              width: width*0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: colorPage.primerycolor,
                ),
                borderRadius: BorderRadius.circular(width*0.2),
              ),
              child: Center(
                child: Text("Skip",style:
                GoogleFonts.muktaVaani(
                  fontSize: width*0.06,
                  color: colorPage.primerycolor,
                  fontWeight: FontWeight.w700,
                ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
