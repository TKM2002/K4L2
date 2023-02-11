/*Need to be able to edit User.dart info here,
show updated info on the page. Maybe add picture later
*/

import 'package:flutter/material.dart';
import 'package:knights4love2/DashboardPages/Messages.dart';
import 'package:knights4love2/DashboardPages/Settings.dart';
import '../Dashboard.dart';
import '../User.dart';

//Login screen layout
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstName =
        TextEditingController(text: User.firstName);
    TextEditingController lastName = TextEditingController(text: User.lastName);
    TextEditingController age = TextEditingController(text: User.age);
    TextEditingController description =
        TextEditingController(text: User.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        titleSpacing: 110,
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: <Widget>[
          const Spacer(
            flex: 3,
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

          const Spacer(flex: 1),

          //DESCRIPTION
          TextField(
            controller: description,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description',
            ),
          ),

          const Spacer(
            flex: 3,
          ),

          //Save
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 180, 17, 17)),
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 224, 203, 19)),
              ),
              onPressed: () {
//Put changes in db instead
                User.setFirst(firstName.text);
                User.setLast(lastName.text);
                User.setAge(age.text);
                User.setDesc(description.text);
              },
              child: const Text(
                'Save',
                textScaleFactor: 2.5,
              )),
          const Spacer(
            flex: 3,
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
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Messages()),
                      (Route<dynamic> route) => false);
                },
              ),

              //Profile
              IconButton(
                icon: const Icon(Icons.person),
                tooltip: 'Go to the homepage',
                color: const Color.fromARGB(255, 224, 203, 19),
                onPressed: () {},
              ),

              //Settings
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Go to the homepage',
                color: const Color.fromARGB(255, 224, 203, 19),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          )),
    );
  }
}
