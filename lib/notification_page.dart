import 'package:car_wash/color_page.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class notiPage extends StatefulWidget {
  const notiPage({super.key});

  @override
  State<notiPage> createState() => _notiPageState();
}

class _notiPageState extends State<notiPage> {
  List noti=[
    "The prowash of maruthi-6H had\ncompleted successfully ",
    "The prowash of maruthi-6H  have\nsome terrible",
    "The prowash of maruthi-6H had\ncompleted successfully "
  ];
  List yes=[
    "The prowash of maruthi-6H had\ncompleted successfully",
    "The prowash of maruthi-6H had\ncompleted successfully",
    "The prowash of maruthi-6H had\ncompleted successfully"
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
        title: Text("Notifications",style:
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
              SizedBox(
                height: width*0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                      fontSize: width * 0.058,
                      fontWeight: FontWeight.w700,
                      color: colorPage.primerycolor,
                    ),
                  ),
                  Text(
                    "Clear all",
                    style: TextStyle(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w600,
                      color: colorPage.color2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: width*0.03,
              ),
              Container(
                height: width*0.8,
                width: width*1,
                child: ListView.separated(
                  itemCount:noti.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Row(
                        children: [
                          SizedBox(width: width*0.08),
                          Text("Delete",style: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w600,
                            color: colorPage.primerycolor,
                          ),),
                        ],
                      ),
                      secondaryBackground:  Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("View",style: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w600,
                            color: colorPage.primerycolor,
                          ),),
                          SizedBox(width: width*0.08),
                        ],
                      ),
                      child: Container(
                        height: width*0.25,
                        width: width*1,
                        color: colorPage.secondarycolor,
                        child: Row(
                          children: [
                            SizedBox(width: width*0.06),
                            Text(
                              noti[index],style:TextStyle(
                              color: colorPage.primerycolor,
                              fontSize: width*0.045,

                            ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: width*0.02,
                    );
                },
                ),
              ),
              SizedBox(
                height: width*0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Yesterday",
                    style: TextStyle(
                      fontSize: width * 0.058,
                      fontWeight: FontWeight.w700,
                      color: colorPage.primerycolor,
                    ),
                  ),
                  Text(
                    "Clear all",
                    style: TextStyle(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w600,
                      color: colorPage.color2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: width*0.03,
              ),
              Container(
                height: width*0.8,
                width: width*1,
                child: ListView.separated(
                  itemCount:yes.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Row(
                        children: [
                          SizedBox(width: width*0.08),
                          Text("Delete",style: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w600,
                            color: colorPage.primerycolor,
                          ),),
                        ],
                      ),
                      secondaryBackground:  Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("View",style: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w600,
                            color: colorPage.primerycolor,
                          ),),
                          SizedBox(width: width*0.08),
                        ],
                      ),
                      child: Container(
                        height: width*0.25,
                        width: width*1,
                        color: colorPage.secondarycolor,
                        child: Row(
                          children: [
                            SizedBox(width: width*0.06),
                            Text(
                              yes[index],style:TextStyle(
                              color: colorPage.primerycolor,
                              fontSize: width*0.045,

                            ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: width*0.02,
                  );
                },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
