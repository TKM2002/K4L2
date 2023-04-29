import 'package:flutter/material.dart';
import 'package:knights4love2/main.dart';
import 'package:knights4love2/User.dart';
import 'package:knights4love2/surveyQuestions/Q2.dart';

class Q1 extends StatelessWidget {
  const Q1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Survey q1',
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
                    MaterialPageRoute(builder: (context) => Homepage()),
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
                'I would describe myself as extraverted',
                textAlign: TextAlign.center,
                textScaleFactor: 3,
              ),

              //ANSWER 1
              ListTile(
                title: const Text('Strongly Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer1(1),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q2()),
                  )
                },
              ),

              //ANSWER 2
              ListTile(
                title: const Text('Mostly Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer1(2),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q2()),
                  )
                },
                //tileColor: bool ? Colors.green : Colors.blue,
                //selectedColor: Colors.green,
                //selected: bool,
              ),

              //ANSWER 3
              ListTile(
                title: const Text('Somewhat Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer1(3),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q2()),
                  )
                },
              ),

              //ANSWER 4
              ListTile(
                title: const Text('Neither Agree/Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer1(4),
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Q2()))
                },
              ),

              //ANSWER 5
              ListTile(
                title: const Text('Somewhat Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer1(5),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q2()),
                  )
                },
              ),

              //ANSWER 6
              ListTile(
                title: const Text('Mostly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer1(6),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q2()),
                  )
                },
              ),

              //ANSWER 7
              ListTile(
                title: const Text('Strongly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer1(7),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q2()),
                  )
                },
              ),
            ])));
  }
}
