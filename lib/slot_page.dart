
import 'dart:io';
import 'package:car_wash/add_vehicle.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/home_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/slot_page2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class slotPage extends StatefulWidget {
  const slotPage({super.key});

  @override
  State<slotPage> createState() => _slotPageState();
}

class _slotPageState extends State<slotPage> {
  String? selectedVehicles;
  String getUrl="";
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
    UploadFile(file) async {
    if(file!=null){
      var uploadtask= await FirebaseStorage.instance.ref("slot_booking").child(
          DateTime.now().toString()).putFile(file,SettableMetadata(
          contentType: "slot_booking/jpeg"
      ));
      getUrl= await uploadtask.ref.getDownloadURL();
      print(getUrl);
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
  final formkey=GlobalKey<FormState>();

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
          child: Form(
            key: formkey,
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
                   child:StreamBuilder<DocumentSnapshot>(
                     stream: FirebaseFirestore.instance.collection("users").doc(currentuserid).snapshots(),
                     builder: (context, snapshot) {
                       if(!snapshot.hasData){
                         return CircularProgressIndicator();
                       }
                       var data=snapshot.data;
                       Map<String,dynamic> slotMap=data?.data() as Map<String,dynamic>;
                       List vehicle=slotMap["vehicle"];
                       return DropdownButton(
                             hint: Text("vehicle number",style: TextStyle(
                               color: colorPage.color2,
                               fontSize: width*0.045,
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
                             value: selectedVehicles,
                             onChanged: (newValue) {
                               setState(() {
                                 selectedVehicles=newValue.toString();
                               });
                             },
                             items: vehicle.map((valueitem) {
                               return DropdownMenuItem(
                                   value: valueitem['Register_no.'],
                                   child: Text(valueitem["vehicletype"]+"-"+valueitem["model"]+"-"+valueitem["Register_no."],style: TextStyle(
                                     color: colorPage.color4,
                                     fontSize: width*0.04
                                   ),));

                             }).toList(),


                           );
                     }
                   ),
                 ),
               ),
                SizedBox(
                  height: width*0.03,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => addVehicle(),));
                    },
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
                  getUrl!=""? Container(
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
                    child: Image(image: NetworkImage(getUrl),),
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
                SizedBox(
                  height: width*0.03,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      UploadFile(file);
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
                                  Lottie.asset(imagePage.lottie,height: width*0.3,width: width*0.4),
                                  Text("Image Saved",textAlign: TextAlign.center,style:
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
                      Future.delayed(Duration(seconds: 1)).then((value) => Navigator.pop(context));
                    },
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
                        child: Text("Save image",style:
                        TextStyle(
                          fontSize: width*0.05,
                          color: colorPage.primerycolor,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width*0.03,
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
                      if(
                      selectedVehicles!=null&&
                      getUrl!=""
                      ){

                        Map<String,dynamic>booking={
                          "vehicle_number":selectedVehicles.toString(),
                          "vehicle_image":getUrl.toString(),
                          "id":currentuserid.toString(),
                          "wash_type": theme[selectindex]["title"],
                          "service_type":option[selectOption]["text"],

                        };

                        Navigator.push(context,MaterialPageRoute(builder: (context) => slotPage2(slotbooking: booking,
                        ),));
                      }else{
                        selectedVehicles==null?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("select your vehicle"))):
                            getUrl==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("add your vehicle's image"))):
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add your booking details")));
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
      ),
    );
  }
}
