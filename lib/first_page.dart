import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';
import 'main.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: width*0.4,
          ),
          Container(
            height: width*0.45,
              width: width*1,
              child: Image.asset(imagePage.image1)),
          Text("Here's where\nwe shine",textAlign: TextAlign.center,style:
            GoogleFonts.muktaVaani(
               fontSize: width*0.08,
               fontWeight: FontWeight.w700,
              color: colorPage.primerycolor,
          )),
          SizedBox(
            height: width*0.05,
          ),
          Text("Book your easy \n be the shiny rock star on the road",
            textAlign: TextAlign.center,
            style: GoogleFonts.muktaVaani(
              fontSize: width*0.055,
              color: colorPage.primerycolor,
            ),
          ),
          SizedBox(
            height: width*0.15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage(),));
            },
            child: Container(
              height: width*0.15,
              width: width*0.45,
              decoration: BoxDecoration(
                color: colorPage.primerycolor,
                borderRadius: BorderRadius.circular(width*0.2),
              ),
              child: Center(
                  child: Text("Login",style:
                    GoogleFonts.muktaVaani(
                      fontSize: width*0.06,
                      color: colorPage.secondarycolor,
                      fontWeight: FontWeight.w700,
                    ),
                    ),
              ),
            ),
          ),
          Text("Or"),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => signup_page(),));
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
                child: Text("Sign up",style:
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
