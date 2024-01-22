import 'package:car_wash/Navigation_bar.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/home_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/signup_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'googlesignin.dart';
import 'location_page.dart';
import 'main.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {


  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool tick = false;
  bool tap = true;
  RegExp emailvalidation = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.08),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: width * 0.24,
                ),
                Center(
                  child: Text(
                    "Welcome back",
                    style: GoogleFonts.muktaVaani(
                      fontSize: width * 0.09,
                      fontWeight: FontWeight.w700,
                      color: colorPage.primerycolor,
                    ),
                  ),
                ),
                Text(
                  "Please login into your account",
                  style: GoogleFonts.muktaVaani(
                    fontSize: width * 0.055,
                    color: colorPage.primerycolor,
                  ),
                ),
                SizedBox(
                  height: width * 0.2,
                ),
                TextFormField(
                  controller: email_controller,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "email",
                    labelStyle: TextStyle(
                      fontSize: width * 0.05,
                      color: colorPage.primerycolor
                    ),
                    hintText: "Please enter your email id",
                    hintStyle: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.w500),
                    focusColor: colorPage.primerycolor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                      ),
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                      ),
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.08,
                ),
                TextFormField(
                  controller: password_controller,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: tap ? true : false,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () {
                          tap = !tap;
                          setState(() {});
                        },
                        child: Icon(
                          tap ? Icons.visibility_off : Icons.visibility,
                          color: colorPage.primerycolor,
                        )),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.w500),
                    focusColor: colorPage.primerycolor,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                      ),
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                      ),
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: colorPage.primerycolor,
                          value: tick,
                          onChanged: (value) {
                            setState(() {
                              tick = value!;
                            });
                          },
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(color: colorPage.primerycolor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Forgot password?",
                          style: TextStyle(color: colorPage.primerycolor),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.1,
                ),
                InkWell(
                  onTap: () {
                    if (email_controller.text != "" &&
                        password_controller.text != "" &&
                        formkey.currentState!.validate()) {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email_controller.text,
                          password: password_controller.text).then((value) async {
                            var data=await FirebaseFirestore.instance.collection("users").where("email",isEqualTo: email_controller.text).get();

                            if(data.docs.isNotEmpty){
                              currentusername=data.docs[0]["name"];
                              currentemail=data.docs[0]["email"];
                              currentpassword=data.docs[0]["password"];
                              currentuserid=data.docs[0].id;

                                SharedPreferences _share = await SharedPreferences.getInstance();

                                _share.setBool("login", true);
                                _share.setString("id", currentuserid.toString());
                                _share.setString("name",currentusername.toString());

                                print("login success");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => navigationPage(),
                                  )).catchError((Error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(Error.code.toString())));
                              });

                            }
                            else{
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => signup_page(),
                        ));
                            }



                      });
                    } else {
                      email_controller.text == ""
                          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("please enter you username")))
                          : password_controller.text == ""
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("please enter your password")))
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "please enter your valid details")));
                    }
                  },
                  child: Container(
                    height: width * 0.12,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                      color: colorPage.primerycolor,
                      borderRadius: BorderRadius.circular(width * 0.2),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: GoogleFonts.muktaVaani(
                          fontSize: width * 0.05,
                          color: colorPage.secondarycolor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width*0.03,
                ),
                InkWell(
                  onTap: () {
                    AuthMethods().signInWithgoogle(context);

                  },
                  child: Container(
                    height: width * 0.12,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: colorPage.primerycolor,

                      ),
                      color: colorPage.secondarycolor,
                      borderRadius: BorderRadius.circular(width * 0.2),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(imagePage.google,height: width*0.055,width: width*0.055),
                          SizedBox(width: width*0.03,),
                          Text(
                            "Signin with Google",
                            style:TextStyle(
                              color: colorPage.primerycolor,
                              fontWeight: FontWeight.w600
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signup_page()));
                      },
                      child: Container(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: colorPage.primerycolor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.04,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
