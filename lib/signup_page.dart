import 'package:car_wash/Navigation_bar.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/home_page.dart';
import 'package:car_wash/intro_page.dart';
import 'package:car_wash/signup_page2.dart';
import 'package:car_wash/slot_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';
import 'main.dart';

class signup_page extends StatefulWidget {
  const signup_page({super.key});

  @override
  State<signup_page> createState() => _signup_pageState();
}

class _signup_pageState extends State<signup_page> {
  bool tap=true;
  TextEditingController name_controller=TextEditingController();
  TextEditingController email_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();
  RegExp emailvalidation=RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+");
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(width*0.08),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: width*0.3,
                ),
                Center(
              child: Text("Welcome",style:
              GoogleFonts.muktaVaani(
                fontSize: width*0.09,
                fontWeight: FontWeight.w700,
                color: colorPage.primerycolor,
              ),
              )),
                Text("Please create a new account",style:
                GoogleFonts.muktaVaani(
                  fontSize: width*0.055,
                  color: colorPage.primerycolor,
                ),
                ),
                SizedBox(
                  height: width*0.2,
                ),
                Container(
                  width: width*1,
                  height: width*0.17,
                  child: TextFormField(
                    controller: name_controller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: width*0.022,
                        left: width*0.03
                      ),
                      labelText: "Name",
                      labelStyle: TextStyle(fontSize: width*0.045,color: colorPage.primerycolor),
                      hintText: "Please enter your name",
                      hintStyle: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),
                      focusColor: colorPage.primerycolor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorPage.primerycolor,
                        ),
                        borderRadius: BorderRadius.circular(width*0.04),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorPage.primerycolor,
                        ),
                        borderRadius: BorderRadius.circular(width*0.04),
                      ),


                    ),
                  ),
                ),
                SizedBox(
                  height: width*0.03,
                ),
                Container(
                  width: width*1,
                  height: width*0.17,
                  child: TextFormField(
                    controller: email_controller,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(
                      !emailvalidation.hasMatch(value!)
                      )
                        {
                          return "Please enter valid email id";
                        }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration( contentPadding: EdgeInsets.only(
                        top: width*0.022,
                        left: width*0.03
                    ),
                      labelText: "Email id",
                      labelStyle: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: colorPage.primerycolor),
                      hintText: "Enter your email id",
                        hintStyle: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),
                      focusColor: colorPage.primerycolor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorPage.primerycolor,
                        ),
                        borderRadius: BorderRadius.circular(width*0.04),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width*0.04),
                        borderSide: BorderSide(
                          color: colorPage.primerycolor
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width*0.04),
                        borderSide: BorderSide(
                          color: colorPage.primerycolor
                        )
                      ),

                    ),
                  ),
                ),
                SizedBox(
                  height: width*0.03,
                ),
                Container(
                  width: width*1,
                  height: width*0.17,
                  child: TextFormField(
                    controller: password_controller,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: tap?true:false,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              tap=!tap;
                              setState(() {

                              });

                            },
                            child: Icon(
                              tap?Icons.visibility_off:Icons.visibility,color: colorPage.primerycolor,size: width*0.055,)),
                        contentPadding: EdgeInsets.only(
                        top: width*0.022,
                        left: width*0.03
                    ),
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: colorPage.primerycolor),
                      hintText: "Enter Password",
                        hintStyle: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500),
                      focusColor: colorPage.primerycolor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorPage.primerycolor,
                        ),
                        borderRadius: BorderRadius.circular(width*0.04),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width*0.04),
                        borderSide: BorderSide(
                          color: colorPage.primerycolor
                        )
                      )

                    ),
                  ),
                ),
                SizedBox(
                  height: width*0.29,
                ),
                InkWell(
                  onTap: () {
                    if(name_controller.text!=""&&
                        email_controller.text!=""&&
                        formkey.currentState!.validate()
                    ) {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email:email_controller.text ,
                          password: password_controller.text
                      ).then((value){
                        FirebaseFirestore.instance.collection("users").add(
                            {
                              "name":name_controller.text,
                              "email":email_controller.text,
                              "password":password_controller.text
                            }
                        );
                        currentusername=name_controller.text;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => intoPage(),));
                        name_controller.clear();
                        email_controller.clear();
                        password_controller.clear();
                      }).catchError((error){
                        ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.code.toString())));
                      });


                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("")));
                    }
                    else{
                      name_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter you username"))):
                      email_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your password"))):
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your valid details")));


                    }
                  },

                  child: Container(
                    height: width*0.15,
                    width: width*0.45,
                    decoration: BoxDecoration(
                      color: colorPage.primerycolor,
                      borderRadius: BorderRadius.circular(width*0.2),
                    ),
                    child: Center(
                      child: Text("Next",style:
                      GoogleFonts.muktaVaani(
                        fontSize: width*0.06,
                        color: colorPage.secondarycolor,
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width*0.16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>loginPage() ));
                      },
                      child: Container(
                        child: Text("Login",style: TextStyle(
                          color: colorPage.primerycolor,
                          fontWeight: FontWeight.w600,
                          fontSize: width*0.04,
                        ),),
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
