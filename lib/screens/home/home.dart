import 'package:better_mentor/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List<Widget> children = [
    ChatMenu(Colors.white),
    ChatMenu(Colors.amber),
    ProfileMenu(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Flutter App",
          style: TextStyle(
            fontFamily: "RussoOne",
          ),
        ),
        actions: [
          Builder(builder: (BuildContext context) {
            return TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign out'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.lightGreenAccent),
              ),
              onPressed: () async {
                CurrentUser? user = Provider.of<CurrentUser?>(context);
                if (user == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('No one has signed in.'),
                  ));
                  return;
                }
                //await Provider.of<CurrentUser?>(context, listen: false).signOut();
                final String uid = user.uid;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(uid + ' has successfully signed out.'),
                ));
              },
            );
          })
        ],
      ),
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlueAccent[200],
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.leaderboard_rounded,
            ),
            label: "Stats",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box_rounded,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
