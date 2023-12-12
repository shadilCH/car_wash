import 'package:car_wash/color_page.dart';
import 'package:car_wash/first_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.secondarycolor,
        title: Text("Profile",style:
        GoogleFonts.muktaVaani(
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
            children: [
              Container(
                height: width*0.45,
                width: width*1,
                decoration: BoxDecoration(
                  color: colorPage.secondarycolor,
                  borderRadius: BorderRadius.circular(width*0.01),
                  border: Border.all(
                      color: colorPage.primerycolor,
                    width: width*0.002,
                  )
                ),
                child: Padding(
                  padding:EdgeInsets.all(width*0.03),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width*0.03,
                      ),
                      CircleAvatar(
                        radius: width*0.15,
                        backgroundImage: AssetImage(imagePage.profile),
                      ),
                      SizedBox(
                        width: width*0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: width*0.03,
                          ),
                          Text("Shadil",style:
                            GoogleFonts.muktaVaani(
                              color: colorPage.primerycolor,
                              fontSize: width*0.05,
                              fontWeight: FontWeight.w600,
                            ),),
                          Text("shadilcheriyil98@gmail.com",style:
                            GoogleFonts.muktaVaani(
                              color: colorPage.color1,
                              fontSize: width*0.04,
                            ),),
                          Text("+624 76597 26",style:
                            GoogleFonts.muktaVaani(
                              color: colorPage.color1,
                              fontSize: width*0.035,
                            ),),
                          SizedBox(
                            height: width*0.04,
                          ),
                          Container(
                            height: width*0.1,
                            width: width*0.35,
                            decoration: BoxDecoration(
                              color: colorPage.primerycolor,
                              borderRadius: BorderRadius.circular(width*0.1),
                            ),
                            child: Center(
                              child: Text(
                                "Edit profile",style:TextStyle(
                                color: colorPage.secondarycolor,
                                fontSize: width*0.04,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width*0.05,
              ),

              ListTile(
                minLeadingWidth: width*0.01,
                leading: Icon(CupertinoIcons.timer,color: colorPage.primerycolor,size: width*0.07),
                title: Text("Recent orders",style:
                  GoogleFonts.muktaVaani(
                    color: colorPage.primerycolor,
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w500,
                  ),),
                trailing: Icon(Icons.navigate_next,color: colorPage.primerycolor,size: width*0.07,),
              ),
              Divider(
                height: width*0.001,
              ),
              ListTile(
                minLeadingWidth: width*0.01,
                leading: Icon(CupertinoIcons.car_detailed,color: colorPage.primerycolor,size: width*0.07),
                title: Text("Added vehicles",style:
                  GoogleFonts.muktaVaani(
                    color: colorPage.primerycolor,
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w500,
                  ),),
                trailing: Icon(Icons.navigate_next,color: colorPage.primerycolor,size: width*0.07,),
              ),
              Divider(
                height: width*0.001,
              ),
              ListTile(
                minLeadingWidth: width*0.01,
                leading: Icon(CupertinoIcons.creditcard,color: colorPage.primerycolor,size: width*0.07),
                title: Text("Payments",style:
                  GoogleFonts.muktaVaani(
                    color: colorPage.primerycolor,
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w500,
                  ),),
                trailing: Icon(Icons.navigate_next,color: colorPage.primerycolor,size: width*0.07,),
              ),
              Divider(
                height: width*0.001,
              ),
              ListTile(
                minLeadingWidth: width*0.01,
                leading: Icon(Icons.radio_button_checked,color: colorPage.primerycolor,size: width*0.07),
                title: Text("Active requests",style:
                  GoogleFonts.muktaVaani(
                    color: colorPage.primerycolor,
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w500,
                  ),),
                trailing: Icon(Icons.navigate_next,color: colorPage.primerycolor,size: width*0.07,),
              ),
              Divider(
                color: colorPage.primerycolor,
                thickness: width*0.005,
              ),
              ListTile(
                minLeadingWidth: width*0.01,
                leading: Icon(CupertinoIcons.question_circle,color: colorPage.color2,size: width*0.07),
                title: Text("FAQ",style:
                GoogleFonts.muktaVaani(
                  color: colorPage.color2,
                  fontSize: width*0.05,
                  fontWeight: FontWeight.w500,
                ),),
                trailing: Icon(Icons.navigate_next,color: colorPage.color2,size: width*0.07,),
              ),
              Divider(
                height: width*0.001,
              ),
              ListTile(
                minLeadingWidth: width*0.01,
                leading: Icon(Icons.share,color: colorPage.color2,size: width*0.07),
                title: Text("Share",style:
                GoogleFonts.muktaVaani(
                  color: colorPage.color2,
                  fontSize: width*0.05,
                  fontWeight: FontWeight.w500,
                ),),
                trailing: Icon(Icons.navigate_next,color: colorPage.color2,size: width*0.07,),
              ),
              Divider(
                height: width*0.001,
              ),
              ListTile(
                minLeadingWidth: width*0.01,
                leading: Icon(Icons.star,color: colorPage.color2,size: width*0.07),
                title: Text("Rate us",style:
                GoogleFonts.muktaVaani(
                  color: colorPage.color2,
                  fontSize: width*0.05,
                  fontWeight: FontWeight.w500,
                ),),
                trailing: Icon(Icons.navigate_next,color: colorPage.color2,size: width*0.07,),
              ),
              Divider(
                height: width*0.001,
              ),
              InkWell(
                onTap: () {
                  showDialog(context: context,
                      builder:(context) {
                        return AlertDialog(
                          shape:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.05),
                          ),
                          title: Text("Are you sure, you want to \nlog out",style: TextStyle(fontSize: width*0.05,color: colorPage.primerycolor),textAlign: TextAlign.center),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => firstPage(),));
                                },
                                child: Container(
                                  height: width*0.1,
                                  width: width*0.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(width*0.05),
                                      color: colorPage.primerycolor
                                  ),
                                  child: Center(child: Text("Yes",style: TextStyle(
                                    fontSize: width*0.04,
                                    color: colorPage.secondarycolor
                                  ),)),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: width*0.1,
                                  width: width*0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(width*0.05),
                                    color: colorPage.primerycolor
                                  ),
                                  child: Center(child: Text("No",style: TextStyle(
                                      fontSize: width*0.04,
                                      color: colorPage.secondarycolor
                                  ),)),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                  );
                },
                child: ListTile(
                  minLeadingWidth: width*0.01,
                  leading: Icon(Icons.logout,color: colorPage.primerycolor,size: width*0.07,),
                  title: Text("Log out",style:
                  GoogleFonts.muktaVaani(
                    color: colorPage.primerycolor,
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
              ),
              SizedBox(
                height: width*0.2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
