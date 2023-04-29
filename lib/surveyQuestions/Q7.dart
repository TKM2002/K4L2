import 'package:flutter/material.dart';
import 'package:knights4love2/User.dart';
import 'Q8.dart';

class Q7 extends StatelessWidget {
  const Q7({super.key});

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
                'I would rather set plans than do something spontaneous',
                textAlign: TextAlign.center,
                textScaleFactor: 3,
              ),

              //ANSWER 1
              ListTile(
                title: const Text('Strongly Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer7(1),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q8()),
                  )
                },
              ),

              //ANSWER 2
              ListTile(
                title: const Text('Mostly Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer7(2),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q8()),
                  )
                },
              ),

              //ANSWER 3
              ListTile(
                title: const Text('Somewhat Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer7(3),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q8()),
                  )
                },
              ),

              //ANSWER 4
              ListTile(
                title: const Text('Neither Agree/Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer7(4),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q8()),
                  )
                },
              ),

              //ANSWER 5
              ListTile(
                title: const Text('Somewhat Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer7(5),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q8()),
                  )
                },
              ),

              //ANSWER 6
              ListTile(
                title: const Text('Mostly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer7(6),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q8()),
                  )
                },
              ),

              //ANSWER 7
              ListTile(
                title: const Text('Strongly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer7(7),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q8()),
                  )
                },
              ),
            ])));
  }
}
