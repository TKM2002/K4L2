import 'package:flutter/material.dart';
import 'package:knights4love2/main.dart';
import 'package:knights4love2/User.dart';
import 'package:knights4love2/Dashboard.dart';

import 'Q4.dart';
//import 'package:knights4love2/surveyQuestions/Q3.dart';

//NEED ASYNC HERE AS WELL SO MATCHES LOAD IN ON FIRST VIEW OF DASHBOARD

class Q3 extends StatelessWidget {
  const Q3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Survey',
            textAlign: TextAlign.right,
            textScaleFactor: 1,
          ),
          /*actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: 'Go to the homepage',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],*/
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 75, 0, 50),
            child: Column(children: <Widget>[
              //QUESTION TEXT
              const Text(
                'I have a task I need to do, I focus on it until I get it done',
                textAlign: TextAlign.center,
                textScaleFactor: 3,
              ),

              //ANSWER 1
              ListTile(
                title: const Text('Strongly Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer3(1),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q4()),
                  )
                },
              ),

              //ANSWER 2
              ListTile(
                  title: const Text('Mostly Disagree'),
                  trailing: const Icon(Icons.adjust),
                  onTap: () => {
                        User.addAnswer3(2),
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Q4()),
                        )
                      }),

              //ANSWER 3
              ListTile(
                title: const Text('Somewhat Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer3(3),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q4()),
                  )
                },
              ),

              //ANSWER 4
              ListTile(
                title: const Text('Neither Agree/Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer3(4),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q4()),
                  )
                },
              ),

              //ANSWER 5
              ListTile(
                title: const Text('Somewhat Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer3(5),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q4()),
                  )
                },
              ),

              //ANSWER 6
              ListTile(
                title: const Text('Mostly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer3(6),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q4()),
                  )
                },
              ),

              //ANSWER 7
              ListTile(
                title: const Text('Strongly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer3(7),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q4()),
                  )
                },
              ),
            ])));
  }
}
