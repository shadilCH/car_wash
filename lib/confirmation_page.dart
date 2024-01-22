import 'package:car_wash/Navigation_bar.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/details_page.dart';
import 'package:car_wash/home_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/payment_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class confirmationPage extends StatefulWidget {
  final Map<String,dynamic>slotbooking;
  const confirmationPage({super.key, required this.slotbooking});

  @override
  State<confirmationPage> createState() => _confirmationPageState();
}

class _confirmationPageState extends State<confirmationPage> {
  String method="";
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
                        child:
                          Image(image: NetworkImage(widget.slotbooking["vehicle_image"]),)
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Container(
                        width:width*0.6,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.slotbooking["wash_type"],
                                  style: TextStyle(
                                      color: colorPage.primerycolor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.045),
                                ),
                                Text(currentusername!.toString(),
                                    style:TextStyle(
                                      color: colorPage.color6,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.04,
                                      height: Checkbox.width * 0.056,
                                    )),
                                Text(widget.slotbooking["vehicle_number"],
                                    style:TextStyle(
                                      color: colorPage.color2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.04,
                                      height: Checkbox.width * 0.056,
                                    )),
                                Text(widget.slotbooking["slot_date"],
                                    style:TextStyle(
                                      color: colorPage.color2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.04,
                                      height: Checkbox.width * 0.056,
                                    )),
                              ],
                            ),

                            Icon(Icons.navigate_next,color:colorPage.color1,)
                          ],
                        ),
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
              Text(widget.slotbooking["location"],style: TextStyle(
                fontSize: width*0.04,
                color: colorPage.color6,
              )),
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
                  if(
                  method!=""
                  ){
                    print(widget.slotbooking);
                    widget.slotbooking.addAll(
                        {
                          "Payment_method":method
                        }
                    );
                    FirebaseFirestore.instance.collection("booking").add(
                        widget.slotbooking
                    );
                    method=="online"?
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
                        }):showModalBottomSheet(context: context,
                        backgroundColor: colorPage.secondarycolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft:Radius.circular(width*0.04),
                              topRight:Radius.circular(width*0.04),
                            )
                        ),

                        builder: (context) {

                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(imagePage.lottie,height: width*0.3,width: width*0.4),
                                Text("Booked Successfully",textAlign: TextAlign.center,style:
                                TextStyle(
                                  fontSize: width*0.08,
                                  fontWeight: FontWeight.w700,
                                  color: colorPage.primerycolor,
                                )),
                              ],
                            ),

                          );



                        }

                    );
                    if(method=="cash"){
                        Future.delayed(Duration(seconds: 1)).then((value) => Navigator.push(context,MaterialPageRoute(builder: (context) =>navigationPage(),)));
                    }
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("select your payment method")));
                  }

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
