import 'package:car_wash/color_page.dart';
import 'package:car_wash/signup_page2.dart';
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
  TextEditingController name_controller=TextEditingController();
  TextEditingController email_controller=TextEditingController();
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
                TextFormField(
                  controller: name_controller,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Your name",
                    labelStyle: TextStyle(fontSize: width*0.05,color: colorPage.primerycolor),
                    hintText: "Please enter your name",
                    hintStyle: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w500),
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
                SizedBox(
                  height: width*0.08,
                ),
                TextFormField(
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
                  decoration: InputDecoration(
                    hintText: "Email id",
                    hintStyle: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w500),
                    focusColor: colorPage.primerycolor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorPage.primerycolor,
                      ),
                      borderRadius: BorderRadius.circular(width*0.04),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => signupPage2(),));
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
                  height: width*0.2,
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
