import 'dart:async';

import 'package:flutter/material.dart';
import 'package:knights4love2/DashboardPages/Messages.dart';
import 'package:knights4love2/User.dart';
import 'package:knights4love2/Dashboard.dart';

//NEED ASYNC HERE AS WELL SO MATCHES LOAD IN ON FIRST VIEW OF DASHBOARD

class Q15 extends StatelessWidget {
  const Q15({super.key});

  @override
  Widget build(BuildContext context) {
    var timer;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Survey',
            textAlign: TextAlign.right,
            textScaleFactor: 1,
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 75, 0, 50),
            child: Column(children: <Widget>[
              //QUESTION TEXT
              const Text(
                'I hope to one day have kids',
                textAlign: TextAlign.center,
                textScaleFactor: 3,
              ),

              //ANSWER 1
              ListTile(
                title: const Text('Strongly Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer15(1),
                  User.addUser(),
                  User.findMatches(),
                  timer = Timer(const Duration(seconds: 2), () {
                    User.shareMatches();
                    timer = Timer(const Duration(seconds: 2), () {
                      User.addMessageSlots();
                    });
                  }),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                      (Route<dynamic> route) => false)
                },
              ),

              //ANSWER 2
              ListTile(
                  title: const Text('Mostly Disagree'),
                  trailing: const Icon(Icons.adjust),
                  onTap: () => {
                        User.addAnswer15(2),
                        User.addUser(),
                        User.findMatches(),
                        timer = Timer(const Duration(seconds: 2), () {
                          User.shareMatches();
                          timer = Timer(const Duration(seconds: 2), () {
                            User.addMessageSlots();
                          });
                        }),
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()),
                            (Route<dynamic> route) => false)
                      }),

              //ANSWER 3
              ListTile(
                title: const Text('Somewhat Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer15(3),
                  User.addUser(),
                  User.findMatches(),
                  timer = Timer(const Duration(seconds: 2), () {
                    User.shareMatches();
                    timer = Timer(const Duration(seconds: 2), () {
                      User.addMessageSlots();
                    });
                  }),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                      (Route<dynamic> route) => false)
                },
              ),

              //ANSWER 4
              ListTile(
                title: const Text('Neither Agree/Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer15(4),
                  User.addUser(),
                  User.findMatches(),
                  timer = Timer(const Duration(seconds: 2), () {
                    User.shareMatches();
                    timer = Timer(const Duration(seconds: 2), () {
                      User.addMessageSlots();
                    });
                  }),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                      (Route<dynamic> route) => false)
                },
              ),

              //ANSWER 5
              ListTile(
                title: const Text('Somewhat Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer15(5),
                  User.addUser(),
                  User.findMatches(),
                  timer = Timer(const Duration(seconds: 2), () {
                    User.shareMatches();
                    timer = Timer(const Duration(seconds: 2), () {
                      User.addMessageSlots();
                    });
                  }),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                      (Route<dynamic> route) => false)
                },
              ),

              //ANSWER 6
              ListTile(
                title: const Text('Mostly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer15(6),
                  User.addUser(),
                  User.findMatches(),
                  timer = Timer(const Duration(seconds: 2), () {
                    User.shareMatches();
                    timer = Timer(const Duration(seconds: 2), () {
                      User.addMessageSlots();
                    });
                  }),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                      (Route<dynamic> route) => false)
                },
              ),

              //ANSWER 7
              ListTile(
                title: const Text('Strongly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer15(7),
                  User.addUser(),
                  User.findMatches(),
                  timer = Timer(const Duration(seconds: 2), () {
                    User.shareMatches();
                    timer = Timer(const Duration(seconds: 2), () {
                      User.addMessageSlots();
                    });
                  }),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                      (Route<dynamic> route) => false)
                },
              ),
            ])));
  }
}
