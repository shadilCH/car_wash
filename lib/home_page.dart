import 'package:car_wash/active_page.dart';
import 'package:car_wash/add_vehicle.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/login_page.dart';
import 'package:car_wash/notification_page.dart';
import 'package:car_wash/powerWash.dart';
import 'package:car_wash/pro_wash.dart';
import 'package:car_wash/quick_wash.dart';
import 'package:car_wash/slot_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'costom_wash.dart';
import 'main.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}
bool login=false;
class _homePageState extends State<homePage> {
  List theme = [
    {
      "image": imagePage.theme1,
      "title": "Quick wash",
      "botton": quickWash(),
    },
    {
      "image": imagePage.theme2,
      "title": "Power wash",
      "botton": powerWash(),
    },
    {
      "image": imagePage.theme3,
      "title": "Pro wash",
      "botton": proWash(),
    },
    {
      "image": imagePage.theme4,
      "title": "Costom wash",
      "botton": costomWash(),
    },
  ];
  bool tap = false;
  int selectindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: colorPage.secondarycolor,
      appBar: AppBar(
        backgroundColor: colorPage.secondarycolor,
        leading: Icon(
          Icons.menu,
          color: colorPage.primerycolor,
          size: width * 0.08,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences _pref = await SharedPreferences.getInstance();
                _pref.remove("login");
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => loginPage(),), (route) => false);
              },
              icon: Icon(Icons.logout,color: colorPage.primerycolor,)),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => notiPage(),));
            },
            child: Icon(
              Icons.notifications_none_rounded,
              color: colorPage.primerycolor,
              size: width * 0.08,
            ),
          ),
          SizedBox(
            width: width * 0.03,
          ),
        ],
        elevation: 0,
      ),
      drawer: Drawer(

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
          Stack(
             alignment: Alignment.bottomCenter,
             children: [
               Container(
                 height: width*0.5,
                 width: width*0.3,
               ),
               tap?Positioned(
                 bottom: width*0.067,
                 child: Container(
                   height: width * 0.3,
                   width: width * 0.3,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(width * 0.05),
                     color: colorPage.primerycolor,
                   ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       InkWell(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => slotPage(),));
                         },
                         child: Container(
                           height: width*0.07,
                           width: width*0.22,
                           decoration: BoxDecoration(
                             color: colorPage.secondarycolor,
                             borderRadius: BorderRadius.circular(width*0.05),
                           ),
                           child: Center(
                             child: Text("Take a slot",style: TextStyle(
                                 color: colorPage.primerycolor,
                                 fontSize: width*0.037
                             ),),
                           ),
                         ),
                       ),
                       InkWell(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => addVehicle(),));
                         },
                         child: Container(
                           height: width*0.07,
                           width: width*0.22,
                           decoration: BoxDecoration(
                             color: colorPage.secondarycolor,
                             borderRadius: BorderRadius.circular(width*0.05),
                           ),
                           child: Center(
                             child: Text("Add vehicle",style: TextStyle(
                                 color: colorPage.primerycolor,
                                 fontSize: width*0.037
                             ),),
                           ),
                         ),
                       ),

                     ],
                   ),
                 ),
               ):SizedBox(),
                InkWell(
                  onTap: () {
                    tap = !tap;
                    setState(() {});
                  },
                  child: tap?CircleAvatar(
                    radius: width*0.06,
                    backgroundColor: colorPage.primerycolor,
                    child: CircleAvatar(
                             radius: width*0.04,
                             backgroundColor: colorPage.color1,
                             child: Icon(CupertinoIcons.multiply,color: colorPage.secondarycolor,),

                    )): Container(
                        height: width * 0.12,
                        width: width * 0.27,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.5),
                          color: colorPage.primerycolor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.plus,
                                color: colorPage.secondarycolor, size: width * 0.06),
                            SizedBox(width: width * 0.01),
                            Text(
                              "Add",
                              style: TextStyle(
                                color: colorPage.secondarycolor,
                                fontSize: width * 0.055,
                              ),
                            )
                          ],
                        )),
                ),
             ],
           ),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width*1,
                height: width*0.14,

                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width*0.02),
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                      ),
                    ),
                    hintText: "Search service",
                    hintStyle: TextStyle(
                      fontSize: width*0.05,color: colorPage.color2
                    ),
                    suffixIcon: Icon(Icons.search,color: colorPage.primerycolor,),

                  ),
                ),
              ),
              SizedBox(
                height: width * 0.03,
              ),
              Text("Offers",
                  style: GoogleFonts.muktaVaani(
                    color: colorPage.primerycolor,
                    fontSize: width * 0.065,
                    fontWeight: FontWeight.w600,
                  )),
              CarouselSlider.builder(
                itemCount: 3,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    selectindex = index;
                    setState(() {});
                  },
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 10),
                  viewportFraction: 1,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    height: width * 0.423,
                    width: width * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    child: Image.asset(
                      imagePage.poster,
                    ),
                  );
                },
              ),
              // SizedBox(
              // height: width*0.02,
              // ),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: selectindex,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: colorPage.primerycolor,
                    dotColor: colorPage.color1,
                    dotWidth: width * 0.02,
                    dotHeight: width * 0.02,
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.03,
              ),
              Text(
                "Active request",
                style: GoogleFonts.muktaVaani(
                  fontSize: width * 0.058,
                  fontWeight: FontWeight.w700,
                  color: colorPage.primerycolor,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => activePage(),));
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
                        child: Image.asset(
                          imagePage.picture1,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Prowash",
                            style: GoogleFonts.muktaVaani(
                                color: colorPage.primerycolor,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.045),
                          ),
                          Text("Car-M5\nKL SG 4357\n26/03/2022",
                              style: GoogleFonts.muktaVaani(
                                color: colorPage.color2,
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.04,
                                height: Checkbox.width * 0.056,
                              )),
                          Row(
                            children: [
                              Text("-----"),
                              SvgPicture.asset(imagePage.picture2,
                                  width: width * 0.03),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                "Vehicle reached at center",
                                style: GoogleFonts.muktaVaani(
                                  color: colorPage.primerycolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.035,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Service theme",
                    style: GoogleFonts.muktaVaani(
                      fontSize: width * 0.058,
                      fontWeight: FontWeight.w700,
                      color: colorPage.primerycolor,
                    ),
                  ),
                  Text(
                    "View all",
                    style: GoogleFonts.muktaVaani(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => theme[index]["botton"],
                            ));
                      },
                      child: Container(
                        width: width * 0.3,
                        height: width * 0.25,
                        color: colorPage.secondarycolor,
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
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: width * 0.03,
                    );
                  },
                ),
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Our customer feedback",
                    style: GoogleFonts.muktaVaani(
                      fontSize: width * 0.058,
                      fontWeight: FontWeight.w700,
                      color: colorPage.primerycolor,
                    ),
                  ),
                  Text(
                    "View all",
                    style: GoogleFonts.muktaVaani(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w600,
                      color: colorPage.color2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Row(
                children: [
                  Container(
                    height: width * 0.4,
                    width: width * 0.43,
                    color: colorPage.secondarycolor,
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: width * 0.03,
                                backgroundImage:
                                    NetworkImage(imagePage.feedback1),
                              ),
                              SizedBox(width: width * 0.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("John samual"),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: colorPage.color3,
                                        size: width * 0.035,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: colorPage.color3,
                                        size: width * 0.035,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: colorPage.color3,
                                        size: width * 0.035,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: colorPage.color3,
                                        size: width * 0.035,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet\nconsectetur. Malesuada a viverra\nviverra rhoncus tellus in massa lacus. In\nauctor est hendrerit id praesent👏🏼\nLaoreet cursus massa neque venenatis\netiam turpis.",
                            style: GoogleFonts.muktaVaani(
                              color: colorPage.color2,
                              fontSize: width * 0.022,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Container(
                    height: width * 0.4,
                    width: width * 0.45,
                    color: colorPage.secondarycolor,
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: width * 0.03,
                                backgroundImage:
                                    NetworkImage(imagePage.feedback2),
                              ),
                              SizedBox(width: width * 0.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("alexa martina"),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: colorPage.color3,
                                        size: width * 0.035,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: colorPage.color3,
                                        size: width * 0.035,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: colorPage.color3,
                                        size: width * 0.035,
                                      ),
                                      Icon(Icons.star,
                                          color: colorPage.color3,
                                          size: width * 0.035),
                                      Icon(
                                        Icons.star,
                                        color: colorPage.color3,
                                        size: width * 0.035,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet\nconsectetur. Malesuada a viverra\nviverra rhoncus tellus in massa lacus. In\nauctor est hendrerit.",
                            style: GoogleFonts.muktaVaani(
                              color: colorPage.color2,
                              fontSize: width * 0.025,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
