import 'package:car_wash/Navigation_bar.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/first_page.dart';
import 'package:car_wash/home_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  getlogin() async {
    SharedPreferences _share=await SharedPreferences.getInstance();

    login=_share.getBool("login")??false;
    currentuserid=_share.getString("id")??"";
    currentusername=_share.getString("name")??"";
    Future.delayed(Duration(
        seconds: 2
    )).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login?navigationPage():firstPage(),)));
    setState(() {

    });
    print(login);
    print("login");
  }


  @override
 void initState() {
    getlogin();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: width*2,
        width: width*1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: width*0.4,
                width: width*0.5,
                child: Image.asset(imagePage.logo)),
            Text("QuickWash",style:
                GoogleFonts.muktaVaani(
                  fontSize:width*0.09,
                  fontWeight: FontWeight.w800,
                  color: colorPage.primerycolor,
                ),
            // TextStyle(
            //   color: colorPage.primerycolor,
            // ),
            ),
          ],
        ),

      ),

    );
  }
}
