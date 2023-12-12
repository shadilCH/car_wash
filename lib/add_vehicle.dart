import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class addVehicle extends StatefulWidget {
  const addVehicle({super.key});
  @override
  State<addVehicle> createState() => _addVehicleState();
}

class _addVehicleState extends State<addVehicle> {
  String? dropdown;
  String? dropdown1;
  bool tick=false;
  List<String> selectitems=[];
  Map<String,List<String>> vehiclelist= {
    "Car": ["BMW", "Mercidez"],
    "Bike": ["Duke", "Royal enfield"]
  };
  TextEditingController regnumber_controller=TextEditingController();
  TextEditingController name_controller=TextEditingController();
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
        title: Text("Add vehicle",style:
        TextStyle(
            color: colorPage.primerycolor,
            fontSize: width*0.06,
            fontWeight: FontWeight.w700
        )
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left:width*0.05,top: width*0.03,right: width*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your vehicle type",
                  style: TextStyle(
                    color: colorPage.primerycolor,
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: width*0.015),
              Container(
                height: width*0.14,
                width: width*1,
                margin: EdgeInsets.only(left:width*0.04,right: width*0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  border: Border.all(color:colorPage.primerycolor),
                ),
                child: Padding(
                  padding: EdgeInsets.all(width*0.03),
                  child: DropdownButton(
                    hint: Text("Enter your vehicle type",style: TextStyle(
                        color: colorPage.color1,
                        fontSize: width*0.045
                    ),),
                    icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      color: colorPage.primerycolor,
                    ),
                    iconSize: width*0.07,
                    isExpanded: true,
                    underline: SizedBox(),
                    borderRadius: BorderRadius.circular(width*0.03),
                    style: TextStyle(
                      fontSize: width*0.06,
                    ),
                    value: dropdown,
                    onChanged: (newvalue) {
                      dropdown=newvalue!;
                      selectitems=vehiclelist[newvalue]!;
                      dropdown1=null;
                      setState(() {
                      });
                    },
                    items: vehiclelist.keys.toList().map((valueItem) {
                      return DropdownMenuItem(
                          value: valueItem,
                          child:Text(valueItem,style: TextStyle(color: colorPage.color4,fontSize: width*0.05),));
                    },).toList()


                  ),
                ),
              ),
              SizedBox(height: width*0.07),
              Text("Model",
                  style: TextStyle(
                    color: colorPage.primerycolor,
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: width*0.015),
              Container(
                height: width*0.14,
                width: width*1,
                margin: EdgeInsets.only(left:width*0.04,right: width*0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  border: Border.all(color:colorPage.primerycolor),
                ),
                child: Padding(
                  padding: EdgeInsets.all(width*0.03),
                  child: DropdownButton(
                    hint: Text("Enter your vehicle model",style: TextStyle(
                        color: colorPage.color1,
                        fontSize: width*0.045
                    ),),
                    icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      color: colorPage.primerycolor,
                    ),
                    iconSize: width*0.07,
                    isExpanded: true,
                    underline: SizedBox(),
                    borderRadius: BorderRadius.circular(width*0.03),
                    style: TextStyle(
                      fontSize: width*0.06,
                    ),
                    value: dropdown1,
                    onChanged: (newvalue) {
                      setState(() {
                        dropdown1=newvalue.toString();
                      });
                    },
                    items: selectitems.map((valueItem) {
                      return DropdownMenuItem(
                          value: valueItem,
                          child:Text(valueItem,style: TextStyle(color: colorPage.color4,fontSize: width*0.05),));
                    },).toList()


                  ),
                ),
              ),
              SizedBox(height: width*0.07),
              Text("Reg.number",
                  style: TextStyle(
                    color: colorPage.primerycolor,
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: width*0.015),
              Container(
                width: width*1,
                height: width*0.14,
                margin: EdgeInsets.only(left: width*0.04,right: width*0.04),
                child: TextFormField(
                  controller: regnumber_controller,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    height: width*0.003
                  ),
                  cursorColor: colorPage.primerycolor,
                  decoration: InputDecoration(
                    hintText: "Please enter your reg.number",
                    hintStyle: TextStyle(
                      color: colorPage.color1,
                      fontSize: width*0.045,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorPage.primerycolor),
                      borderRadius: BorderRadius.circular(width*0.03),
                    ),
                    enabledBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(width*0.03),
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                      ),
                  ),
                  ),
                ),
              ),
              SizedBox(height: width*0.07),
              Text("Client",
                  style: TextStyle(
                    color: colorPage.primerycolor,
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: width*0.015),
              Container(
                width: width*1,
                height: width*0.14,
                margin: EdgeInsets.only(left: width*0.04,right: width*0.04),
                child: TextFormField(
                  controller: name_controller,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    height: width*0.003
                  ),
                  cursorColor: colorPage.primerycolor,
                  decoration: InputDecoration(
                    hintText: "Please enter your name",
                    hintStyle: TextStyle(
                      color: colorPage.color1,
                      fontSize: width*0.045,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorPage.primerycolor),
                      borderRadius: BorderRadius.circular(width*0.03),
                    ),
                    enabledBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(width*0.03),
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                      ),
                  ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: colorPage.primerycolor,
                    value: tick,
                    onChanged:(value) {
                      setState(() {
                        tick=value!;
                      });
                    },
                  ),
                  Text("Set as default servicing",style: TextStyle(color: colorPage.primerycolor),),
                ],
              ),
              SizedBox(
                height: width*0.35,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    if(
                    name_controller.text!=""&&
                        regnumber_controller.text!=""
                    ){
                    showModalBottomSheet(context: context,
                        backgroundColor: colorPage.secondarycolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(width*0.04),
                          topRight:Radius.circular(width*0.04),
                        )
                      ), builder: (context) {
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(imagePage.lottie,height: width*0.4,width: width*0.4),
                                Text("Location saved",textAlign: TextAlign.center,style:
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
                  }
                    else {
                      name_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter you name"))):
                      regnumber_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your register number"))):
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your valid details")));
                    }
    },
                  child: Container(
                    height: width*0.13,
                    width: width*0.45,
                    decoration: BoxDecoration(
                      color: colorPage.primerycolor,
                      borderRadius: BorderRadius.circular(width*0.2),
                    ),
                    child: Center(
                      child: Text("Add",style:
                      GoogleFonts.muktaVaani(
                        fontSize: width*0.06,
                        color: colorPage.secondarycolor,
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width*0.05,
              ),

            ],
          ),
        ),
      ),
    );
  }
}


