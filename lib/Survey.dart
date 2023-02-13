import 'package:flutter/material.dart';
import 'package:knights4love2/main.dart';
import 'surveyQuestions/Q1.dart';
import 'package:knights4love2/User.dart';

class Survey extends StatelessWidget {
  const Survey({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController age = TextEditingController();
    TextEditingController description = TextEditingController();

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
            flex: 4,
          ),

          //HEADING
          const Text(
            'Please fill out the following questions',
            textAlign: TextAlign.center,
            textScaleFactor: 3,
          ),
          const Spacer(
            flex: 4,
          ),

          //FIRST NAME
          TextField(
            controller: firstName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'First Name',
            ),
          ),
          const Spacer(
            flex: 1,
          ),

          //LAST NAME
          TextField(
            controller: lastName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Last Name',
            ),
          ),
          const Spacer(
            flex: 1,
          ),

          //AGE
          TextField(
            controller: age,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Age',
            ),
          ),
          const Spacer(
            flex: 1,
          ),

          //DESCRIPTION
          TextField(
            controller: description,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description',
            ),
          ),

          const Spacer(flex: 4),

          //GENDER
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 180, 17, 17)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 224, 203, 19)),
                  ),
                  //https://stackoverflow.com/questions/63371978/flutter-web-on-hover-how-to-change-flatbutton-text-color
                  //Hover effects
                  //onHover: const Color.fromARGB(255, 180, 17, 17),
                  onPressed: (() => User.changeGender("Male")),
                  child: const Text('Male')),
              const Spacer(flex: 1),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 180, 17, 17)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 224, 203, 19)),
                  ),
                  onPressed: (() => User.changeGender("Female")),
                  child: const Text('Female')),
              const Spacer(flex: 3)
            ],
          ),

          const Spacer(
            flex: 4,
          ),

          //NEXT
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 180, 17, 17)),
              foregroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 224, 203, 19)),
            ),
            onPressed: () {
              if (firstName.text != "" &&
                  lastName.text != "" &&
                  age.text != "" &&
                  User.gender != "") {
                User.setFirst(firstName.text);
                User.setLast(lastName.text);
                User.setAge(age.text);
                User.setDesc(description.text);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Q1()),
                    (Route<dynamic> route) => false);
              }
            },
            child: const Text(
              'Next',
              textScaleFactor: 1.5,
            ),
          ),
          const Spacer(
            flex: 4,
          )
        ])));
  }
}
