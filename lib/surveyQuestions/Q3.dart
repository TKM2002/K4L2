import 'package:flutter/material.dart';
import 'package:knights4love2/main.dart';
import 'package:knights4love2/User.dart';
import 'package:knights4love2/Dashboard.dart';
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
        body: Center(
            child: Column(children: <Widget>[
          const Spacer(
            flex: 1,
          ),

          //QUESTION TEXT
          const Text(
            'How sentimental are you?',
            textAlign: TextAlign.center,
            textScaleFactor: 3,
          ),
          const Spacer(
            flex: 1,
          ),

          //ANSWER 1
          ListTile(
            title: const Text('Not sentimental at all'),
            trailing: const Icon(Icons.adjust),
            onTap: () => {
              User.addAnswer3(1),
              User.addUser(),
              User.findMatches(),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                  (Route<dynamic> route) => false)
            },
          ),

          //ANSWER 2
          ListTile(
              title: const Text('A little bit'),
              trailing: const Icon(Icons.adjust),
              onTap: () => {
                    User.addAnswer3(2),
                    User.addUser(),
                    User.findMatches(),
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard()),
                        (Route<dynamic> route) => false)
                  }),

          //ANSWER 3
          ListTile(
            title: const Text('Only when other people around me are'),
            trailing: const Icon(Icons.adjust),
            onTap: () => {
              User.addAnswer3(3),
              User.addUser(),
              User.findMatches(),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                  (Route<dynamic> route) => false)
            },
          ),

          //ANSWER 4
          ListTile(
            title: const Text('Fairly sentimental'),
            trailing: const Icon(Icons.adjust),
            onTap: () => {
              User.addAnswer3(4),
              User.addUser(),
              User.findMatches(),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                  (Route<dynamic> route) => false)
            },
          ),

          //ANSWER 5
          ListTile(
            title: const Text('Very sentimental'),
            trailing: const Icon(Icons.adjust),
            onTap: () => {
              User.addAnswer3(5),
              User.addUser(),
              User.findMatches(),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                  (Route<dynamic> route) => false)
            },
          ),
          const Spacer(
            flex: 1,
          ),
        ])));
  }
}
