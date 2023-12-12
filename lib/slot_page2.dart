import 'package:car_wash/color_page.dart';
import 'package:car_wash/confirmation_page.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class slotPage2 extends StatefulWidget {
  const slotPage2({super.key});

  @override
  State<slotPage2> createState() => _slotPage2State();
}

class _slotPage2State extends State<slotPage2> {
  int selectindex=0;
  List time=[
    "09:00am",
    "10:00am",
    "11:00am",
    "12:00pm",
    "01:00pm",
    "02:00pm",
    "03:00pm",
    "04:00pm",
  ];
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
        title: Text("Take a slot",style:
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
              SizedBox(height: width*0.03),
              Text("Take a date",style: TextStyle(
              color: colorPage.primerycolor,
              fontSize: width*0.055,
              fontWeight: FontWeight.w600
          ),),
              SizedBox(
                height: width*0.03,
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_outlined,
                    color: colorPage.primerycolor,
                    size: width*0.09),
                    SizedBox(width: width*0.03),
                    Expanded(
                      child: DropdownDatePicker(
                        inputDecoration: InputDecoration(
                            enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: colorPage.primerycolor, width: width*0.001),
                              borderRadius: BorderRadius.circular(width*0.03),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: colorPage.primerycolor),
                              borderRadius: BorderRadius.circular(width*0.03),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: colorPage.primerycolor,width: width*0.001),
                                borderRadius: BorderRadius.circular(width*0.03))),
                        // optional
                        // isDropdownHideUnderline: true, // optional
                        // isFormValidator: true, // optional
                        startYear: 1995, // optional
                        endYear: 2040, // optional
                        width: width*0.03, // optional
                        selectedDay: 14, // optional
                        selectedMonth: 12, // optional
                        selectedYear: 2023, // optional
                        onChangedDay: (value) => print('onChangedDay: $value'),
                        onChangedMonth: (value) => print('onChangedMonth: $value'),
                        onChangedYear: (value) => print('onChangedYear: $value'),
                        boxDecoration: BoxDecoration(
                        border: Border.all(color: colorPage.primerycolor, width: 1.0),
                          borderRadius: BorderRadius.circular(width*0.03),
                        ), // optional
                        // showDay: false,// optional
                        dayFlex: 2,
                        monthFlex: 2,
                        yearFlex: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: width*0.03),
              Text("Pic a slot",style: TextStyle(
                  color: colorPage.primerycolor,
                  fontSize: width*0.055,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(height: width*0.03),
              Container(
                height: width*0.45,
                width: width*1,
                margin: EdgeInsets.only(left: width*0.03,right: width*0.03),
                child: GridView.builder(
                  itemCount: time.length,
                  physics:  NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    childAspectRatio: width*0.0055,
                    mainAxisSpacing: width*0.02,
                    crossAxisSpacing: width*0.07,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return  InkWell(
                      onTap: () {
                        selectindex=index;
                        setState(() {

                        });
                      },
                      child: Container(
                        height: width*0.17,
                        width: width*0.23,
                        // margin: EdgeInsets.only(left: width*0.05,right: width*0.05),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.03),
                            border: Border.all(
                              color: colorPage.primerycolor,
                              width: width*0.003,
                            ),
                          color: selectindex==index?colorPage.color5:colorPage.secondarycolor,
                        ),
                        child: Center(
                          child: Text(time[index],style: TextStyle(
                            fontSize: width*0.045,
                            color: selectindex==index?colorPage.primerycolor:colorPage.color4,
                          ),),
                        ),
                      ),
                    );
                  },

                ),
              ),
              Row(
                children: [
                  Text("Add your note",style: TextStyle(
                      color: colorPage.primerycolor,
                      fontSize: width*0.055,
                      fontWeight: FontWeight.w600
                  ),),
                  SizedBox(
                    width: width*0.01,
                  ),
                  Text("(Optional)",style: TextStyle(
                      color: colorPage.primerycolor,
                      fontSize: width*0.035,
                      fontWeight: FontWeight.w500
                  ),),
                ],
              ),
              Padding(
                padding:  EdgeInsets.all(width*0.03),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: width*0.04,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          width*0.03
                      ),
                      borderSide: BorderSide(width: width*0.004,color: colorPage.primerycolor),
                    ),
                  ),
                ),
              ),
              Text("Add your location",style: TextStyle(
                  color: colorPage.primerycolor,
                  fontSize: width*0.055,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(height: width*0.02),
              Padding(
                padding:  EdgeInsets.all(width*0.03),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: width*0.04,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          width*0.03
                      ),
                      borderSide: BorderSide(width: width*0.004,color: colorPage.primerycolor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: width*0.03),
              Center(
                child: Container(
                  height: width*0.1,
                  width: width*0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.2),
                    border: Border.all(color: colorPage.primerycolor,width: width*0.003)
                  ),
                  child: Center(
                    child: Text("From saved",style:
                    TextStyle(
                      fontSize: width*0.05,
                      color: colorPage.primerycolor,
                      fontWeight: FontWeight.w700,
                    ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: width*0.08),
              InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => confirmationPage(),));
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
                      child: Text("Payment",style:
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
