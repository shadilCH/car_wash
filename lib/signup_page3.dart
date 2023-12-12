import 'package:car_wash/color_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'intro_page.dart';
import 'login_page.dart';
import 'main.dart';

class signupPage3 extends StatefulWidget {
  const signupPage3({super.key});

  @override
  State<signupPage3> createState() => _signupPage3State();
}

class _signupPage3State extends State<signupPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: width*0.3,
            ),
            Center(
              child: Text("Welcome",
                style: GoogleFonts.muktaVaani(
                  fontSize: width*0.09,
                  fontWeight: FontWeight.w700,
                  color: colorPage.primerycolor,
                ),),
            ),
            Text("Please enter your OTP",textAlign: TextAlign.center, style:
            GoogleFonts.muktaVaani(
              fontSize: width*0.055,
              color: colorPage.primerycolor,
            ),
            ),
            SizedBox(
              height: width*0.1,
            ),
            Pinput(
              defaultPinTheme: PinTheme(
                height: width*0.14,
                width: width*0.13,
                textStyle: TextStyle(fontSize: width*0.06),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width*0.03),
                  border: Border.all(
                      width: width*0.0007,
                      color: colorPage.primerycolor),
                ),
              ),
            ),
            SizedBox(
              height: width*0.07,
            ),
            Text("Resent OTP",style:
                GoogleFonts.muktaVaani(
                  fontWeight: FontWeight.w600,
                  fontSize: width*0.05,
                  color: colorPage.primerycolor,
                ),
            ),
            SizedBox(
              height: width*0.65,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => intoPage(),));
              },
              child: Container(
                height: width*0.15,
                width: width*0.45,
                decoration: BoxDecoration(
                  color: colorPage.primerycolor,
                  borderRadius: BorderRadius.circular(width*0.2),
                ),
                child: Center(
                  child: Text("Sign in",style:
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
              height: width*0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>loginPage() ));
                  },
                  child: Container(
                    child: Text("Login",style: TextStyle(
                      color: colorPage.primerycolor,
                      fontWeight: FontWeight.w600,
                      fontSize: width*0.04,
                    ),),
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
