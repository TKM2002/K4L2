import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:knights4love2/DashboardPages/Messages.dart';
import 'package:knights4love2/DashboardPages/Profile.dart';
import 'package:knights4love2/main.dart';
import '../Dashboard.dart';
import '../User.dart';

//Login screen layout
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: <Widget>[
          const Spacer(
            flex: 1,
          ),

          //Log out
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 180, 17, 17)),
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 224, 203, 19)),
              ),
              onPressed: () {
                User.Matches = [
                  "No current match",
                  "No current match",
                  "No current match"
                ];
                User.compatibility = [-10.0, -10.0, -10.0];
                print(User.messageSlots);
                print('before delete');
                User.messageSlots = [];
                print(User.messageSlots);
                print('after delete');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                    (Route<dynamic> route) => false);
              },
              child: const Text(
                'Log out',
                textScaleFactor: 2.5,
              )),
          const Spacer(
            flex: 1,
          ),

          //Delete Account
          /*Remove User.username from all docs in matches subcollection
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 180, 17, 17)),
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 224, 203, 19)),
              ),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(User.username)
                    .delete();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                    (Route<dynamic> route) => false);
              },
              child: const Text(
                'Delete Account',
                textScaleFactor: 2.5,
              )),
          const Spacer(
            flex: 1,
          ),
          */
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: const Color.fromARGB(255, 180, 17, 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Home
              IconButton(
                icon: const Icon(Icons.home),
                tooltip: 'Go to the homepage',
                color: const Color.fromARGB(255, 224, 203, 19),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                      (Route<dynamic> route) => false);
                },
              ),

              //Messages
              IconButton(
                icon: const Icon(Icons.message),
                tooltip: 'Go to the homepage',
                color: const Color.fromARGB(255, 224, 203, 19),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Messages()),
                      (Route<dynamic> route) => false);
                },
              ),

              //Profile
              IconButton(
                icon: const Icon(Icons.person),
                tooltip: 'Go to the homepage',
                color: const Color.fromARGB(255, 224, 203, 19),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                      (Route<dynamic> route) => false);
                },
              ),

              //Settings
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Go to the homepage',
                color: const Color.fromARGB(255, 224, 203, 19),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
