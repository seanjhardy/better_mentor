import 'package:better_mentor/models/user.dart';
import 'package:better_mentor/screens/authenticate/authenticate.dart';
import 'package:better_mentor/screens/home/home.dart';
import 'package:better_mentor/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // retrieve firebaseAuth from above in the widget tree
    final user = Provider.of<CurrentUser>(context);
    return StreamBuilder<CurrentUser?>(
      stream: Provider.of<AuthService>(context).getAuth().authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          CurrentUser? user = snapshot.data;
          return user == null ? Authenticate() : Home();
        }
      },
    );
  }
}
