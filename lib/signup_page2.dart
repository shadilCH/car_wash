import 'package:car_wash/color_page.dart';
import 'package:car_wash/signup_page3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';
import 'main.dart';

class signupPage2 extends StatefulWidget {
  const signupPage2({super.key});

  @override
  State<signupPage2> createState() => _signupPage2State();
}

class _signupPage2State extends State<signupPage2> {
  TextEditingController number_controller=TextEditingController();
  RegExp numbervalidation =RegExp(r'[0-9]{10}');
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.08),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: width*0.3,
                ),
                Center(
                  child: Text("Welcome",
                    style: GoogleFonts.muktaVaani(
                      fontSize: width*0.09,
                      fontWeight: FontWeight.w700,
                      color: colorPage.primerycolor,
                    ),),
                ),
                Text("Please enter your contact number \n we will send a OTP",textAlign: TextAlign.center, style:
                GoogleFonts.muktaVaani(
                  fontSize: width*0.055,
                  color: colorPage.primerycolor,
                ),
                ),
                SizedBox(
                  height: width*0.2,
                ),
                TextFormField(
                  maxLength: 10,
                  controller: number_controller,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if(
                    !numbervalidation.hasMatch(value!)
                    )
                    {
                      return "Please enter valid contact number";
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Please enter your contect number",
                    hintStyle: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w500),
                    labelText: "Contact number",
                    labelStyle: TextStyle(fontSize: width*0.05,color: colorPage.primerycolor),
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
                  height: width*0.4,
                ),
                InkWell(
                  onTap: () {
                    if(
                    number_controller.text!="" &&
                        formkey.currentState!.validate()
                    )
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signupPage3(),));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please wait for OTP")));
                      }
                    else{
                      number_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your contact number"))):
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Please enter your valid details")));
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
                      child: Text("Continue",style:
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
