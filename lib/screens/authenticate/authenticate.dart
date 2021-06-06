import "package:flutter/material.dart";
import "sign_in.dart";

class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Positioned(
                    left: 0.0,
                    top: 10.0,
                    child: Icon(
                      Icons.sports_esports_rounded,
                      size: 200,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.sports_esports_rounded,
                    size: 200,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                width: 400,
                child: Card(
                  child: SignIn(),
                ),
              ),
            ],
          )
      ),
    );
  }
}
