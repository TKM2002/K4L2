/*
Use list tile for chats, put several icons in and show name
 */
import 'package:flutter/material.dart';
import 'package:knights4love2/DashboardPages/ChatList.dart';
import 'package:knights4love2/DashboardPages/MessageUserTemplate.dart';
import 'package:knights4love2/DashboardPages/Profile.dart';
import 'package:knights4love2/DashboardPages/Settings.dart';
import 'package:knights4love2/User.dart';
import '../Dashboard.dart';

//Login screen layout
class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Messages> {
  List<MessageUsers> users = [
    MessageUsers(firstName: User.firstName, lastName: User.lastName)
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: <Widget>[
          //Chats
          //https://www.freecodecamp.org/news/build-a-chat-app-ui-with-flutter/
          //This shows how to make chat pages

          ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ChatList(
                firstName: users[index].firstName,
                lastName: users[index].lastName,
              );
            },
          ),
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
                onPressed: () {},
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


//https://blog.logrocket.com/how-to-migrate-a-flutter-mobile-app-to-the-web/
//convert to web and make database