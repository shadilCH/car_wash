
import 'package:car_wash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'first_page.dart';
var width;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.muktaVaaniTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: splashScreen(),

      ),
    );
  }
}
