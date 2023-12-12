import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/signup_page2.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'location_page.dart';
import 'main.dart';

class intoPage extends StatefulWidget {
  const intoPage({super.key});

  @override
  State<intoPage> createState() => _intoPageState();
}

class _intoPageState extends State<intoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: width*1.8,
                width: width*1,
                child: IntroductionScreen(
                  showSkipButton: false,
                  showDoneButton: true,
                  showNextButton: true,
                  done: Text("Done",style:
                    TextStyle(
                        color: colorPage.primerycolor,
                      fontWeight: FontWeight.w700,
                    ),),
                  onDone: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => locationPage(),));
                  },
                  next: Text("Skip",style: TextStyle(
                    color: colorPage.primerycolor,
                    fontWeight: FontWeight.w700,
                  )),
                  dotsDecorator: DotsDecorator(
                    activeColor: colorPage.primerycolor,
                    activeShape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(width*0.05),
                    ),
                    activeSize: Size(width*0.1, width*0.018)
                  ),
                  pages: [
                    PageViewModel(
                        titleWidget: Text("On site",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: width*0.08,
                          color: colorPage.primerycolor,
                        ),
                      ),
                      decoration: PageDecoration(
                        titlePadding: EdgeInsets.all(width*0.03),
                        bodyAlignment: Alignment.center,
                      ),
                      bodyWidget: Container(
                        height: width*1,
                          width: width*1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: width*0.8,
                              width: width*1,
                              child: Image.asset(imagePage.intro1),
                            ),
                            Text("You can  book  slot with location \n our service get your door step",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: width*0.05,color: colorPage.primerycolor),
                            )
                          ],
                        ),
                      ),
                    ),
                    PageViewModel(
                      titleWidget: Text("Self visit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: width*0.08,
                          color: colorPage.primerycolor,
                        ),
                      ),
                      decoration: PageDecoration(
                        titlePadding: EdgeInsets.all(width*0.03),
                        bodyAlignment: Alignment.center,
                      ),
                      bodyWidget: Container(
                        height: width*1,
                          width: width*1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: width*0.8,
                              width: width*1,
                              child: Image.asset(imagePage.intro2),
                            ),
                            Text("You can book a slot and go at \n workstation",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: width*0.05,color: colorPage.primerycolor),
                            )
                          ],
                        ),
                      ),
                    ),
                    PageViewModel(
                      titleWidget: Text("Pickup and drop",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: width*0.08,
                          color: colorPage.primerycolor,
                        ),
                      ),
                      decoration: PageDecoration(
                        titlePadding: EdgeInsets.all(width*0.03),
                        bodyAlignment: Alignment.center,
                      ),
                      bodyWidget: Container(
                        height: width*1,
                          width: width*1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: width*0.8,
                              width: width*1,
                              child: Image.asset(imagePage.intro3),
                            ),
                            Text("You can choose pickup &  Drop \n facility",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: width*0.05,color: colorPage.primerycolor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
