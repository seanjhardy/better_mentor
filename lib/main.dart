// @dart=2.9
import 'package:better_mentor/screens/authenticate/authenticate.dart';
import 'package:better_mentor/screens/home/home.dart';
import 'package:better_mentor/screens/loading/loading.dart';
import 'package:better_mentor/screens/wrapper.dart';
import 'package:better_mentor/services/auth.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:provider/provider.dart';
import "package:splashscreen/splashscreen.dart";

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setMinWindowSize(const Size(600,800));
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrentUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: "Better Mentor",
        home: IntroScreen(),
        routes: {
          "/" : (context) => IntroScreen(),
          "/home": (context) => Home(),
          "/auth": (context) => Authenticate(),
        },
      ),
    );
  }
}
