import 'package:car_wash/Navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database.dart';
import 'home_page.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithgoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
    await googleSignInAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;
    if (result != null) {
      Map<String, dynamic> userInfoMap = {
        "email": userDetails?.email,
        "name": userDetails?.displayName,
        "imgUrl": userDetails?.photoURL,
        "id": userDetails?.uid
      };

      await DatabaseMethods()
          .addUser(userDetails!.uid, userInfoMap)
          .then((value) async {
            currentusername=userInfoMap["name"];
            currentuserid=userInfoMap["id"];
        SharedPreferences _share= await SharedPreferences.getInstance();
        _share.setBool("login", true);
        _share.setString("name", currentusername.toString());
        _share.setString("id",currentuserid.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => navigationPage(),
            ));
      });
    }
  }
}
