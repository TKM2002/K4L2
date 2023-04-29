import 'package:flutter/material.dart';
import 'package:knights4love2/User.dart';
import 'Q7.dart';

class Q6 extends StatelessWidget {
  const Q6({super.key});

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
                'When in a social situation, I find myself being the life of the party',
                textAlign: TextAlign.center,
                textScaleFactor: 3,
              ),

              //ANSWER 1
              ListTile(
                title: const Text('Strongly Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer6(1),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q7()),
                  )
                },
              ),

              //ANSWER 2
              ListTile(
                title: const Text('Mostly Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer6(2),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q7()),
                  )
                },
              ),

              //ANSWER 3
              ListTile(
                title: const Text('Somewhat Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer6(3),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q7()),
                  )
                },
              ),

              //ANSWER 4
              ListTile(
                title: const Text('Neither Agree/Disagree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer6(4),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q7()),
                  )
                },
              ),

              //ANSWER 5
              ListTile(
                title: const Text('Somewhat Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer6(5),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q7()),
                  )
                },
              ),

              //ANSWER 6
              ListTile(
                title: const Text('Mostly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer6(6),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q7()),
                  )
                },
              ),

              //ANSWER 7
              ListTile(
                title: const Text('Strongly Agree'),
                trailing: const Icon(Icons.adjust),
                onTap: () => {
                  User.addAnswer6(7),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Q7()),
                  )
                },
              ),
            ])));
  }
}
