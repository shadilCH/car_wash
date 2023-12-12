import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class proWash extends StatefulWidget {
  const proWash({super.key});

  @override
  State<proWash> createState() => _proWashState();
}

class _proWashState extends State<proWash> {
  List text=[
    "Engine bay dry cleaning",
    "Tire dressing",
    "Glass polish",
    "Air fresher",
    "Interior vaccum cleaning",
    "Under body cleaning"

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: colorPage.primerycolor)),
        backgroundColor: colorPage.secondarycolor,
        title: Text("Pro wash",style:
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
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: width*0.03,
              ),
              Center(
                child: Container(
                  height: width*0.6,
                  width: width*0.7,
                  child: Image.asset(imagePage.intro1),
                ),
              ),
              Text("Let’us clean simply",style:
              GoogleFonts.muktaVaani(
                  fontWeight: FontWeight.w700,
                  color: colorPage.primerycolor,
                  fontSize: width*0.05
              )),
              Text("Lorem ipsum dolor sit amet consectetur. Leo\nporttitor sit purus urna. Habitant volutpat\nmassa a at eget dictum tellus ac eget. Pulvinar\ncursus curabitur nonLorem ipsum tincidunt diam\nsollicitudin. Ullamcorper eu massa eleifend  tellus ",style:
              GoogleFonts.muktaVaani(
                  color: colorPage.color2,
                  fontSize: width*0.04
              )),
              ListView.builder(
                shrinkWrap: true,
                itemCount: text.length,
                scrollDirection:Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return checkBoxClass(
                      text: text[index]);
                },

              ),
              Container(
                height: width*0.15,
                width: width*1,
                color: colorPage.secondarycolor,
                child:Row(
                  children: [
                    SizedBox(width: width*0.04),
                    Text("\$3275/-",style: TextStyle(
                      fontSize: width*0.06,
                      fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(width: width*0.03,),
                    Text("only",style: TextStyle(
                      fontSize: width*0.04,
                    ),)

                  ],
                ),

              ),
              SizedBox(height: width*0.25),
              Container(
                height: width*0.13,
                width: width*0.45,
                decoration: BoxDecoration(
                  color: colorPage.primerycolor,
                  borderRadius: BorderRadius.circular(width*0.2),
                ),
                child: Center(
                  child: Text("Book",style:
                  GoogleFonts.muktaVaani(
                    fontSize: width*0.06,
                    color: colorPage.secondarycolor,
                    fontWeight: FontWeight.w700,
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
class checkBoxClass extends StatefulWidget {
  const checkBoxClass({super.key, required this.text});
  final String text;
  @override
  State<checkBoxClass> createState() => _checkBoxClassState();
}

class _checkBoxClassState extends State<checkBoxClass> {
  bool tick=true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value:tick,
          activeColor: colorPage.color2,
          onChanged: (value) {
            setState(() {
              tick=value!;
            });
          },
        ),
        Text(widget.text,style:TextStyle(
          color: colorPage.color2,
        )
        ),
      ],
    );
  }
}


