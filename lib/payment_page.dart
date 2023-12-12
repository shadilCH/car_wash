import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class paymentPage extends StatefulWidget {
  const paymentPage({super.key});

  @override
  State<paymentPage> createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
  bool tick=false;
  final controller = FlipCardController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController= TextEditingController();
  TextEditingController validController= TextEditingController();
  TextEditingController cvvController= TextEditingController();
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
        title: Text("Payment",style:
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
        padding:  EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: width*0.05,
              ),
              GestureFlipCard(
                  axis: FlipAxis.vertical,
                  frontWidget: Container(
                    height: width*0.55,
                    width: width*1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.04),
                      gradient:LinearGradient(colors: [colorPage.grad1,colorPage.grad2]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Container(
                               height: width*0.15,
                                 width: width*0.4,
                                 child:Image(image: AssetImage(imagePage.card1)),
                             ),
                          ],
                        ),
                        SizedBox(height: width*0.03),
                        Row(
                          children: [
                            SizedBox(width: width*0.1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Card Number",style: TextStyle(
                                  fontSize: width*0.035,
                                  color: colorPage.card1,
                                ),),
                                Text(numberController.text==""?"1234":numberController.text,style: TextStyle(
                                  color: colorPage.card2,
                                  fontSize: width*0.05,
                                  fontWeight: FontWeight.w600,
                                ),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: width*0.04),
                        Row(
                          children: [
                            SizedBox(width: width*0.1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cardholder Name",style: TextStyle(
                                  fontSize: width*0.035,
                                  color: colorPage.card1,
                                ),),
                                Text(nameController.text==""?"Unknown":nameController.text,style: TextStyle(
                                  color: colorPage.card2,
                                  fontSize: width*0.05,
                                  fontWeight: FontWeight.w600,
                                ),),
                              ],
                            ),
                            SizedBox(width: width*0.08),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width*0.04),
                                  child: Text("Exp",style: TextStyle(
                                    fontSize: width*0.035,
                                    color: colorPage.card1,
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left:width*0.1),
                                  child: Text(validController.text==""?"18/30":validController.text,style: TextStyle(
                                    color: colorPage.card2,
                                    fontSize: width*0.05,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                ),
                              ],
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                  backWidget:  Container(
                    height: width*0.55,
                    width: width*1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.04),
                      gradient:LinearGradient(colors: [colorPage.grad1,colorPage.grad2]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: width*0.02),
                        Center(
                          child: Text("Customer service: +123 45 678.12.345",style: TextStyle(
                            fontSize: width*0.03,
                            color: colorPage.secondarycolor,
                          ),),
                        ),
                        Container(
                          width: width*1,
                          height: width*0.15,
                          color: colorPage.color4,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width*0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Authorized Signature",style: TextStyle(
                                color: colorPage.secondarycolor,
                                fontSize: width*0.032,
                                fontWeight: FontWeight.w600,
                              ),),
                              Text("Not Valid Unless Signed",style: TextStyle(
                                color: colorPage.secondarycolor,
                                fontSize: width*0.032,
                                fontWeight: FontWeight.w600,
                              ),),
                              SizedBox(width: width*0.07),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width*0.05),
                          child: Row(
                            children: [
                              Container(
                                width: width*0.7,
                                height: width*0.13,
                                color: colorPage.color2,
                              ),
                              Container(
                                height: width*0.08,
                                width: width*0.1,
                                color: colorPage.secondarycolor,
                                child: Center(child: Text(cvvController.text==""?"123":cvvController.text,style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


              ),
              SizedBox(
                height: width*0.1,
              ),
              Container(
                height: width*0.15,
                width: width*1,
                child: TextFormField(
                  maxLines: 1,
                  controller: nameController,
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                  keyboardType: TextInputType.name,
                  cursorHeight: width*0.06,
                  cursorColor: colorPage.primerycolor,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(width*0.03),
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                        width: width*0.004,
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width*0.03),
                      borderSide: BorderSide(width: width*0.004,color: colorPage.primerycolor),
                    ),
                    labelText: "Cardholder name",
                    labelStyle: TextStyle(
                      color: colorPage.primerycolor,
                      fontSize: width*0.05
                    ),
                  ),

                ),
              ),
              SizedBox(height: width*0.1),
              Container(
                height: width*0.15,
                width: width*1,
                child: TextFormField(
                  maxLines: 1,
                  controller: numberController,
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                  keyboardType: TextInputType.number,
                  cursorHeight: width*0.06,
                  cursorColor: colorPage.primerycolor,
                  obscureText: true,
                  obscuringCharacter: "*",style: TextStyle(
                    fontSize: width*0.06,
                    color: colorPage.primerycolor
                ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(width*0.03),
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                        width: width*0.004,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width*0.03),
                      borderSide: BorderSide(width: width*0.004,color: colorPage.primerycolor),
                    ),
                    labelText: "Card Number",
                    labelStyle: TextStyle(
                      color: colorPage.primerycolor,
                      fontSize: width*0.05
                    ),
                  ),

                ),
              ),
              SizedBox(height: width*0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: width*0.15,
                    width: width*0.4,
                    child: TextFormField(
                      maxLines: 1,
                      controller: validController,
                      onChanged: (value) {
                        setState(() {

                        });
                      },
                      keyboardType: TextInputType.number,
                      cursorHeight: width*0.06,
                      cursorColor: colorPage.primerycolor,
                      obscureText: true,
                      obscuringCharacter: "*",style: TextStyle(
                        fontSize: width*0.06,
                        color: colorPage.primerycolor
                    ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(
                            color: colorPage.primerycolor,
                            width: width*0.004,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(width: width*0.004,color: colorPage.primerycolor),
                        ),
                        labelText: "Valid thru",
                        labelStyle: TextStyle(
                            color: colorPage.primerycolor,
                            fontSize: width*0.05
                        ),
                      ),

                    ),
                  ),
                  Container(
                    height: width*0.15,
                    width: width*0.4,
                    child: TextFormField(
                      controller: cvvController,
                      onChanged: (value) {
                        setState(() {

                        });
                      },
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      cursorHeight: width*0.06,
                      cursorColor: colorPage.primerycolor,
                      obscureText: true,
                      obscuringCharacter: "*",style: TextStyle(
                      fontSize: width*0.06,
                      color: colorPage.primerycolor,
                    ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(
                            color: colorPage.primerycolor,
                            width: width*0.004,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(width: width*0.004,color: colorPage.primerycolor),
                        ),
                        labelText: "CVV",
                        labelStyle: TextStyle(
                            color: colorPage.primerycolor,
                            fontSize: width*0.05
                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: colorPage.primerycolor,
                    value: tick,
                    onChanged: (value) {
                    setState(() {
                      tick=value!;
                    });
                  },),
                  Text("Set as default card",style: TextStyle(
                    color: colorPage.primerycolor,
                  ),)
                ],
              ),
              SizedBox(
                height: width*0.2,
              ),
              Center(
                child: InkWell(
                  onTap:() {
                    showModalBottomSheet(
                        context:context,
                        backgroundColor: colorPage.secondarycolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(width*0.05),
                            topLeft: Radius.circular(width*0.05),
                          )
                        ),
                        builder: (context) {
                          return Container(
                            height: width*1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(imagePage.lottie,height: width*0.4,width: width*0.4),
                                Text("Payment successefull",textAlign: TextAlign.center,style:
                                TextStyle(
                                  fontSize: width*0.07,
                                  fontWeight: FontWeight.w700,
                                  color: colorPage.primerycolor,
                                )),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Booking ID",style: TextStyle(
                                        color: colorPage.color2,
                                        fontSize: width*0.05,
                                      ),),
                                      Text("- #243142",style: TextStyle(
                                        color: colorPage.primerycolor,
                                        fontSize: width*0.05,
                                        fontWeight: FontWeight.w600,
                                      ),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                    );
                  },
                  child: Container(
                    height: width*0.13,
                    width: width*0.45,
                    decoration: BoxDecoration(
                      color: colorPage.primerycolor,
                      borderRadius: BorderRadius.circular(width*0.2),
                    ),
                    child: Center(
                      child: Text("Confirm",style:
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
