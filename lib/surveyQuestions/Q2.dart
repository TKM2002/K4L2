import 'package:flutter/material.dart';
import 'package:knights4love2/main.dart';
import 'package:knights4love2/User.dart';
import 'Q3.dart';

//import 'package:knights4love_app/surveyQuestions/Q3.dart';

class Q2 extends StatelessWidget {
  const Q2({super.key});

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
          actions: <Widget>[
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
          ],
        ),
        body: Center(
            child: Column(children: <Widget>[
          const Spacer(
            flex: 1,
          ),

          //QUESTION TEXT
          const Text(
            'Do you find it easy to stay calm under pressure?',
            textAlign: TextAlign.center,
            textScaleFactor: 3,
          ),
          const Spacer(
            flex: 1,
          ),

          //ANSWER 1
          ListTile(
            title: const Text('Not at all'),
            trailing: const Icon(Icons.adjust),
            onTap: () => {
              User.addAnswer(1),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Q3()),
                  (Route<dynamic> route) => false)
            },
          ),

          //ANSWER 2
          ListTile(
            title: const Text('Usually not'),
            trailing: const Icon(Icons.adjust),
            onTap: () => {
              User.addAnswer(2),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Q3()),
                  (Route<dynamic> route) => false)
            },
            //tileColor: bool ? Colors.green : Colors.blue,
            //selectedColor: Colors.green,
            //selected: bool,
          ),

          //ANSWER 3
          ListTile(
            title: const Text('Depends on the situation'),
            trailing: const Icon(Icons.adjust),
            onTap: () => {
              User.addAnswer(3),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Q3()),
                  (Route<dynamic> route) => false)
            },
          ),

          //ANSWER 4
          ListTile(
            title: const Text('Usually'),
            trailing: const Icon(Icons.adjust),
            onTap: () => {
              User.addAnswer(4),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Q3()),
                  (Route<dynamic> route) => false)
            },
          ),

          //ANSWER 5
          ListTile(
            title: const Text('Yes, all the time'),
            trailing: const Icon(Icons.adjust),
            onTap: () => {
              User.addAnswer(5),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Q3()),
                  (Route<dynamic> route) => false)
            },
          ),
          const Spacer(
            flex: 1,
          ),
        ])));
  }
}
