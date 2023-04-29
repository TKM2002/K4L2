import 'package:flutter/material.dart';
import 'package:knights4love2/User.dart';
import 'Q6.dart';

class Q5 extends StatelessWidget {
  const Q5({super.key});

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
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 75, 0, 50),
            child: Column(children: <Widget>[
              //QUESTION TEXT
              const Text(
                'I tend to set high expectations for myself and others',
                textAlign: TextAlign.center,
                textScaleFactor: 3,
              ),

              //ANSWER 1
              ListTile(
                title: const Text('Strongly Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer5(1),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q6()),
                  )
                },
              ),

              //ANSWER 2
              ListTile(
                title: const Text('Mostly Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer5(2),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q6()),
                  )
                },
              ),

              //ANSWER 3
              ListTile(
                title: const Text('Somewhat Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer5(3),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q6()),
                  )
                },
              ),

              //ANSWER 4
              ListTile(
                title: const Text('Neither Agree/Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer5(4),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q6()),
                  )
                },
              ),

              //ANSWER 5
              ListTile(
                title: const Text('Somewhat Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer5(5),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q6()),
                  )
                },
              ),

              //ANSWER 6
              ListTile(
                title: const Text('Mostly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer5(6),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q6()),
                  )
                },
              ),

              //ANSWER 7
              ListTile(
                title: const Text('Strongly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer5(7),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q6()),
                  )
                },
              ),
            ])));
  }
}
