import 'package:better_mentor/screens/authenticate/authenticate.dart';
import 'package:better_mentor/screens/authenticate/sign_in.dart';
import 'package:better_mentor/screens/home/home.dart';
import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:splashscreen/splashscreen.dart";
import "package:provider/provider.dart";

class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<FirebaseAuth>(context).currentUser;
    return new SplashScreen(
        navigateAfterSeconds: user != null ? Home() : Authenticate(),
        seconds: 3,
        title: new Text(
          'Welcome To Meet up!',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset('assets/icons/MutateCreature.png', scale: 5, fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("flutter"),
        loaderColor: Colors.red);
  }
}