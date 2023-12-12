
import 'dart:io';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/slot_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class slotPage extends StatefulWidget {
  const slotPage({super.key});

  @override
  State<slotPage> createState() => _slotPageState();
}

class _slotPageState extends State<slotPage> {
  String? dropdown;
  var file;
  PickedFile(ImageSource)async{
    final imageFile= await ImagePicker.platform.pickImage(source: ImageSource);
    file=File(imageFile!.path);
    if(mounted){
      setState(() {
        file=File(imageFile.path);
      });
    }


  }
  int selectindex = 0;
  int selectOption=0;
  List number=[
    "Car-M5 KL-53 SG 4357",
    "Car- ShiftM5 KL-10 AB 4357"
  ];
  List theme = [
    {
      "image": imagePage.theme1,
      "title": "Quick wash",
    },
    {
      "image": imagePage.theme2,
      "title": "Power wash",
    },
    {
      "image": imagePage.theme3,
      "title": "Pro wash",
    },
  ];
  List option=[
    {
      "text": "On site"
    },
    {
      "text": "Self visit"
    },
    {
      "text": "Pic up and drop "
    },
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
        title: Text("Booking",style:
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
              Text("Service vehicle",style: TextStyle(
                color: colorPage.primerycolor,
                fontSize: width*0.06,
                fontWeight: FontWeight.w600
              ),),
             Container(
               height: width*0.14,
               width: width*1,
               margin: EdgeInsets.all(width*0.03),
               // color: Colors.yellow,
               decoration: BoxDecoration(
                 // color: colorPage.secondarycolor,
                 borderRadius: BorderRadius.circular(width*0.03),
                 border: Border.all(color: colorPage.primerycolor),
               ),
               child: Padding(
                 padding: EdgeInsets.all(width*0.03),
                 child: DropdownButton(
                   hint: Text("vehicle number",style: TextStyle(
                     color: colorPage.color2,
                     fontSize: width*0.05,
                   ),),
                   dropdownColor: colorPage.secondarycolor,
                   icon: Icon(Icons.arrow_drop_down),
                   iconSize: width*0.06,
                   isExpanded: true,
                   underline: SizedBox(),
                   borderRadius: BorderRadius.circular(width*0.03),
                   style: TextStyle(
                       color:colorPage.color2,
                       fontSize: width*0.05
                   ),
                   value: dropdown,
                   onChanged: (newValue) {
                     setState(() {
                       dropdown=newValue as String;
                     });
                   },
                   items: number.map((valueitem) {
                     return DropdownMenuItem(
                         value: valueitem,
                         child: Text(valueitem));

                   }).toList(),


                 ),
               ),
             ),
              SizedBox(
                height: width*0.03,
              ),
              Center(
                child: Container(
                  height: width*0.11,
                  width: width*0.43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.2),
                    border: Border.all(
                      color: colorPage.primerycolor,
                    )
                  ),
                  child: Center(
                    child: Text("Add another",style:
                    TextStyle(
                      fontSize: width*0.05,
                      color: colorPage.primerycolor,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width*0.03,
              ),
              Row(
                children: [
                  Text("Add image",style: TextStyle(
                      color: colorPage.primerycolor,
                      fontSize: width*0.06,
                      fontWeight: FontWeight.w600
                  )),
                  SizedBox(
                    width: width*0.02,
                  ),
                  Text("(Optional)",style: TextStyle(
                    color: colorPage.primerycolor,
                    fontSize: width*0.04,
                  ),)
                ],
              ),
              InkWell(
                onTap: () {
                  PickedFile(ImageSource.gallery);
                },
                child:
                file!=null? Container(
                  height: width*0.5,
                  width: width*1,
                  margin: EdgeInsets.all(width*0.03),
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.01),
                      border: Border.all(
                          color: colorPage.color4
                      )
                  ),
                  child: Image.file(file),
                ):
                Container(
                  height: width*0.5,
                  width: width*1,
                  margin: EdgeInsets.all(width*0.03),
                  decoration:
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.01),
                      border: Border.all(
                        color: colorPage.color4
                      )
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(imagePage.addimage,color: colorPage.color5),
                      Text("Upload your  vehicle image",style: TextStyle(
                        color: colorPage.color5,
                        fontSize: width*0.04,
                        fontWeight: FontWeight.w600
                      ),)
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Pic a service",style: TextStyle(
                      color: colorPage.primerycolor,
                      fontSize: width*0.06,
                      fontWeight: FontWeight.w600
                  )),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w600,
                      color: colorPage.color2,
                    ),
                  ),

                ],
              ),
              Container(
                height: width * 0.3,
                width: width * 1,
                child: ListView.separated(
                  itemCount: theme.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        selectindex=index;
                        setState(() {
                        });
                      },
                      child: Container(
                      width: width * 0.3,
                      height: width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color:selectindex==index?colorPage.color5:colorPage.secondarycolor,
                        border:selectindex==index?Border.all(width: width*0.002,color: colorPage.primerycolor):Border.all(width:width*0.0,color: colorPage.secondarycolor ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            theme[index]["image"],
                            height: width * 0.15,
                            width: width * 0.15,
                            color: colorPage.primerycolor,
                          ),
                          Text(theme[index]["title"]),
                        ],
                      ),
                  ),
                    ); }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: width*0.02);
                },
                ),
              ),
              SizedBox(height: width*0.03),
              Text("Pic your comfort",style: TextStyle(
                  color: colorPage.primerycolor,
                  fontSize: width*0.06,
                  fontWeight: FontWeight.w600
              )),
              SizedBox(height: width*0.02),
              Container(
                width: width*1,
                height: width*0.45,
                child: ListView.separated(
                  itemCount: option.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index) {
                    return InkWell(
                      onTap: () {
                        selectOption=index;
                        setState(() {});
                      },
                      child: Container(
                        height: width*0.1,
                        width: width*1,
                        decoration: BoxDecoration(
                          color: selectOption==index?colorPage.color5:colorPage.secondarycolor,
                          border:Border.all(width: width*0.002,color: colorPage.primerycolor),
                          borderRadius: BorderRadius.circular(width*0.03),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: width*0.05),
                                child: Text(option[index]["text"],style: TextStyle(
                                  fontSize: width*0.04,
                                  color: colorPage.primerycolor,

                                ),),
                              ),
                              selectOption==index?Icon(Icons.verified,color: colorPage.primerycolor,size: width*0.06,):
                              SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                   return SizedBox(
                      height: width*0.03,
                    );
                },
                ),
              ),
              SizedBox(height: width*0.03),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => slotPage2(),));
                  },
                  child: Container(
                    height: width*0.13,
                    width: width*0.45,
                    decoration: BoxDecoration(
                      color: colorPage.primerycolor,
                      borderRadius: BorderRadius.circular(width*0.2),
                    ),
                    child: Center(
                      child: Text("Next",style:
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
              SizedBox(height: width*0.05),
            ],
          ),
        ),
      ),
    );
  }
}
