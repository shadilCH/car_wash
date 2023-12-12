import 'package:car_wash/color_page.dart';
import 'package:car_wash/details_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/payment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class confirmationPage extends StatefulWidget {
  const confirmationPage({super.key});

  @override
  State<confirmationPage> createState() => _confirmationPageState();
}

class _confirmationPageState extends State<confirmationPage> {
  String method="online";
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
        title: Text("Confirmation",style:
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
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: width*0.02),
              Text("Details",style: TextStyle(
                  color: colorPage.primerycolor,
                  fontSize: width*0.055,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(height: width*0.02),
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
              SizedBox(height: width*0.02),
              Text("Location",style: TextStyle(
                  color: colorPage.primerycolor,
                  fontSize: width*0.055,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(height: width*0.02),
              Center(
                child: Text("52, Race Course Rd, Racecourse, Gandhi Nagar,\nBengaluru, Karnataka 560001",style: TextStyle(
                  fontSize: width*0.04,
                  color: colorPage.color6,
                )),
              ),
              SizedBox(height: width*0.04),
              Text("Payment method",style: TextStyle(
                  color: colorPage.primerycolor,
                  fontSize: width*0.055,
                  fontWeight: FontWeight.w600
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Online payment",style: TextStyle(
                    fontSize: width*0.04,
                    color: colorPage.color6,
                  )),
                  SizedBox(width: width*0.03),
                  Radio(
                    activeColor: colorPage.primerycolor,
                      value: "online",
                      groupValue: method,
                      onChanged: (value) {
                        setState(() {
                          method=value!;
                        });
                      },),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Cash on delivery",style: TextStyle(
                    fontSize: width*0.04,
                    color: colorPage.color6,
                  )),
                  SizedBox(width: width*0.03),
                  Radio(
                    activeColor: colorPage.primerycolor,
                    value: "cash",
                    groupValue: method,
                    onChanged: (value) {
                      setState(() {
                        method=value!;
                      });
                    },),
                ],
              ),
              SizedBox(
                height: width*0.1,
              ),
              Container(
                height: width*0.15,
                width: width*1,
                color: colorPage.secondarycolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Price :",style: TextStyle(
                      fontSize: width*0.04,
                      fontWeight: FontWeight.w600,
                    )),
                    SizedBox(width: width*0.01),
                    Text("\$3600",style: TextStyle(
                      fontSize: width*0.06,
                      fontWeight: FontWeight.w600,
                      color: colorPage.primerycolor
                    )),
                    SizedBox(width: width*0.1),
                  ],
                ),
              ),
              SizedBox(height: width*0.3),
              InkWell(
                onTap: () {
                  showModalBottomSheet(context: context,
                    backgroundColor:colorPage.secondarycolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight:Radius.circular(width*0.05),
                          topLeft: Radius.circular(width*0.05),
                        )),
                    builder: (context) {
                    return Container(
                      height: width*0.6,
                      child: Column(
                        children: [
                          SizedBox(height: width*0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(CupertinoIcons.multiply,color:colorPage.color2)),
                              SizedBox(width: width*0.08),
                              Text("Add your bank account",style: TextStyle(
                                color: colorPage.primerycolor,
                                fontSize: width*0.065,
                                fontWeight: FontWeight.w800,
                              ),)
                            ],
                          ),
                          SizedBox(
                            height: width*0.07,
                          ),
                          Text("To book your service on Quick was you need\nto add a bank account",style: TextStyle(
                            fontSize: width*0.04,
                            color: colorPage.color6,
                            height: width*0.004,
                          ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: width*0.08,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => paymentPage()));
                            },
                            child: Container(
                              height: width*0.13,
                              width: width*0.45,
                              decoration: BoxDecoration(
                                color: colorPage.primerycolor,
                                borderRadius: BorderRadius.circular(width*0.2),
                              ),
                              child: Center(
                                child: Text("Get started",style:
                                TextStyle(
                                  fontSize: width*0.06,
                                  color: colorPage.secondarycolor,
                                  fontWeight: FontWeight.w700,
                                ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                },
                child: Center(
                  child: Container(
                    height: width*0.13,
                    width: width*0.45,
                    decoration: BoxDecoration(
                      color: colorPage.primerycolor,
                      borderRadius: BorderRadius.circular(width*0.2),
                    ),
                    child: Center(
                      child: Text("Proceed",style:
                      TextStyle(
                        fontSize: width*0.06,
                        color: colorPage.secondarycolor,
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: width*0.03),
            ],
          ),
        ),
      ),
    );
  }
}
