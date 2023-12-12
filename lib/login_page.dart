import 'package:car_wash/color_page.dart';
import 'package:car_wash/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'location_page.dart';
import 'main.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  setlogin() async {
    SharedPreferences _share = await SharedPreferences.getInstance();

    _share.setBool("login",true);

    print("login success");
  }


  TextEditingController name_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();
  final formkey=GlobalKey<FormState>();
  bool tick=false;
  bool tap=true;
  RegExp passwordvalidation=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
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
                  child: Text("Welcome back",style:
                    GoogleFonts.muktaVaani(
                      fontSize: width*0.09,
                      fontWeight: FontWeight.w700,
                      color: colorPage.primerycolor,
                    ),
                    ),
                ),
                Text("Please login into your account",style:
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
                    labelText: "User name",
                    labelStyle: TextStyle(fontSize: width*0.05,),
                    hintText: "Please enter your Username",
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
                  controller: password_controller,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: tap?true:false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if(
                    !passwordvalidation.hasMatch(value!)
                    )
                      {
                        return "please enter valid password";
                      }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        tap=!tap;
                        setState(() {

                        });

                      },
                        child: Icon(
                            tap?Icons.visibility_off:Icons.visibility,color: colorPage.primerycolor,)),
                    hintText: "Password",
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
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: colorPage.primerycolor,
                              value: tick,
                              onChanged:(value) {
                                setState(() {
                                  tick=value!;
                                });
                              },
                          ),
                          Text("Remember me",style: TextStyle(color: colorPage.primerycolor),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Forgot password?",style: TextStyle(color: colorPage.primerycolor),)
                        ],
                      ),

                    ],
                  ),
                SizedBox(
                  height: width*0.1,
                ),
                InkWell(
                  onTap: () {
                    setlogin();
                    if(name_controller.text!=""&&
                        password_controller.text!=""&&
                        formkey.currentState!.validate()
                    ) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => locationPage(),));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login completed")));
                    }
                    else{
                      name_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter you username"))):
                          password_controller.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your password"))):
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
                      child: Text("Login",style:
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
                  height: width*0.25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>signup_page() ));
                      },
                      child: Container(
                        child: Text("Sign up",style: TextStyle(
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
