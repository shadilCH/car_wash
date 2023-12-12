import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class detailsPage extends StatefulWidget {
  const detailsPage({super.key});

  @override
  State<detailsPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
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
        title: Text("Order details",style:
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
        padding: EdgeInsets.only(left: width*0.05,right: width*0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: width*0.03),
              Container(
                height: width*0.52,
                width: width*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.02),
                ),
                child: Image.asset(imagePage.order,fit: BoxFit.fill,),
              ),
              SizedBox(height: width*0.05),
              Padding(
                padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vehicle",
                      style: TextStyle(
                        fontSize: width * 0.058,
                        fontWeight: FontWeight.w700,
                        color: colorPage.primerycolor,
                      ),
                    ),
                    Text("Vehicle                              :    Car",style: TextStyle(
                      color: colorPage.color6,
                      fontSize: width*0.045
                    ),),
                    Text("Model                                :    M5",style: TextStyle(
                      color: colorPage.color6,
                      fontSize: width*0.045
                    ),),
                    Text("Reg.number                   :    KL-53 SG 4357",style: TextStyle(
                      color: colorPage.color6,
                      fontSize: width*0.045
                    ),),
                    Text("Client                                 :    Navaneey",style: TextStyle(
                      color: colorPage.color6,
                      fontSize: width*0.045
                    ),),
                    Text("Phone                                :    +624 76597 26",style: TextStyle(
                      color: colorPage.color6,
                      fontSize: width*0.045
                    ),),
                    SizedBox(
                      height: width*0.05,
                    ),
                    Text(
                      "Service details",
                      style: TextStyle(
                        fontSize: width * 0.058,
                        fontWeight: FontWeight.w700,
                        color: colorPage.primerycolor,
                      ),
                    ),
                    Text("service                              :    Prowash",style: TextStyle(
                        color: colorPage.color6,
                        fontSize: width*0.045
                    ),),
                    SizedBox(
                      height: width*0.05,
                    ),
                    Text(
                      "Slot date",
                      style: TextStyle(
                        fontSize: width * 0.058,
                        fontWeight: FontWeight.w700,
                        color: colorPage.primerycolor,
                      ),
                    ),
                    Text("Date                                    :    26/03/2022 ",style: TextStyle(
                        color: colorPage.color6,
                        fontSize: width*0.045
                    ),),
                    Text("Time                                    :   09:00am",style: TextStyle(
                        color: colorPage.color6,
                        fontSize: width*0.045
                    ),),
                    SizedBox(
                      height: width*0.05,
                    ),
                    Text(
                      "Payment  details",
                      style: TextStyle(
                        fontSize: width * 0.058,
                        fontWeight: FontWeight.w700,
                        color: colorPage.primerycolor,
                      ),
                    ),
                    Text("Payment method        :    Online payment",style: TextStyle(
                        color: colorPage.color6,
                        fontSize: width*0.045
                    ),),
                    Text("Payment status            :    Payment completed",style: TextStyle(
                        color: colorPage.color6,
                        fontSize: width*0.045
                    ),),
                  ],
                ),
              ),
              SizedBox(height: width*0.2)
            ],
          ),
        ),
      ),

    );
  }
}
