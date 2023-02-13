import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'DashboardPages/Settings.dart';
import 'DashboardPages/Messages.dart';
import 'DashboardPages/Profile.dart';
import 'User.dart';

//Dashboard screen layout
//Needs to check if login is successful, if not dont change pages, if so then go to survey

//Create question style option to make adding new questions easy, use this site
//https://api.flutter.dev/flutter/material/ListTile-class.html
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dashboard',
          textAlign: TextAlign.right,
          textScaleFactor: 1,
        ),
      ),
      body: Center(
          child: Column(children: <Widget>[
        const Spacer(
          flex: 4,
        ),

//Put actual matches in here, show picture, name, and percent match
        //your top matches
        Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 180, 17, 17),
          child: const Text(
            'Your top matches',
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Color.fromARGB(255, 224, 203, 19),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),

        //Top match
        Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 180, 17, 17),
          child: Text(
            User.Matches[0],
            textScaleFactor: 1.5,
            style: const TextStyle(
              color: Color.fromARGB(255, 224, 203, 19),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),

        //Second match
        Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 180, 17, 17),
          child: Text(
            User.Matches[1],
            textScaleFactor: 1.5,
            style: const TextStyle(
              color: Color.fromARGB(255, 224, 203, 19),
            ),
          ),
        ),
        const Spacer(flex: 1),

        //Third match
        Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 180, 17, 17),
          child: Text(
            User.Matches[2],
            textScaleFactor: 1.5,
            style: const TextStyle(
              color: Color.fromARGB(255, 224, 203, 19),
            ),
          ),
        ),

        //Put in buttons that go to chats

        const Spacer(
          flex: 4,
        ),

        //VERSE OF THE WEEK
        const Text(
          'Verse of the week: Ecclesiastes 4:9',
          textScaleFactor: 1.35,
        ),
        const Text(
          '"Two are better than one, because they have a good return for their labor: If either of them falls down, one can help the other up."',
          textScaleFactor: 1.2,
          textAlign: TextAlign.center,
        ),

        const Spacer(flex: 4),

        //CALVIN DATES
        const Text(
          'Plan your next date around Calvin',
          textScaleFactor: 1.35,
        ),
        const Spacer(flex: 1),
        const Text(
          'Uknighted and Knightengals at 7:30 in the CFAC',
          textScaleFactor: 1.2,
        ),
        const Text(
          'Recital Hall December 7th',
          textScaleFactor: 1.2,
        ),

        const Spacer(
          flex: 4,
        )
      ])),
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
                onPressed: () {},
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
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          )),
    );
  }
}

/*
Top bar:
  K4L logo

Page layout:
  top three matches
  verse of the day
  upcoming calvin events

Bottom bar:
  left, current 'main' page
  center, chat page, use onPressed: _Chats to go to void screen function
  right, settings page, can log out aka go to homescreen

//Use children instead of child for multiple icons
//https://www.codegrepper.com/search.php?answer_removed=1&q=displaying%20a%20row%20of%20icons%20in%20flutter
            
 */



