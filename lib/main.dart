//Joshua DeWindt
//Remember to run 'flutter run' from VS code terminal to start

//Run from web with 'flutter run -d chrome'

//Before deploying, must run flutter build web or it won't update, then change the database rules

//firebase packages needed to connect to database
//Documentation site for firebase
//https://firebase.flutter.dev/docs/firestore/usage
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleSpacing: 70,
          backgroundColor: Color.fromARGB(255, 180, 17, 17),
          foregroundColor: Color.fromARGB(255, 224, 203, 19),
        ),
      ),
      home: const Homepage(),
    );
  }
}

//define class
//start with global variables
//then define app bar and body
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  static List<Object> user = [];
  static List<String> pass = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Welcome to Knights 4 Love',
          textAlign: TextAlign.left,
          textScaleFactor: 1,
        ),
        toolbarHeight: 110,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
//Add a picture here, adjust buttons to be closer together

            //Login button
            Container(
                margin: const EdgeInsets.symmetric(),
                height: 50,
                width: 200,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 180, 17, 17)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 224, 203, 19)),
                  ),
                  onPressed: () {
                    //Get a local list of all usernames and passwords
                    CollectionReference users =
                        FirebaseFirestore.instance.collection('users');
                    users.get().then((res) => res.docs.forEach((element) {
                          user.add(element.get("username"));
                          pass.add(element.get("password"));
                        }));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    'Click here to login',
                    textScaleFactor: 1.5,
                  ),
                )),

            //Register button
            Container(
                margin: const EdgeInsets.symmetric(),
                height: 50,
                width: 220,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 180, 17, 17)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 224, 203, 19)),
                  ),
                  onPressed: () {
                    //Get a local list of all usernames
                    CollectionReference users =
                        FirebaseFirestore.instance.collection('users');
                    users.get().then((res) => res.docs.forEach((element) {
                          user.add(element.get("username"));
                        }));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  child: const Text(
                    'Click here to register',
                    textScaleFactor: 1.5,
                  ),
                ))
          ])),
      backgroundColor: const Color.fromARGB(255, 92, 13, 13),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 233, 6, 6),
        child: Container(height: 50.0),
      ),
    );
  }
}




/*
CHANGELOG
https://www.tutorialkart.com/flutter/flutter-login-screen/
How to create login/register screen
added 9/22/2022
https://www.flutterbeads.com/space-between-widgets-in-flutter/
How to make space between child elements
added 9/22/2022
https://www.youtube.com/watch?v=1e8_S8OGwg4
How to make different classes for each screen
in their own file for organization
added 10/06/2022
https://stackoverflow.com/questions/50037710/flutter-move-to-a-new-screen-without-providing-navigate-back-to-previous-screen
How to make a page without a return widget or path
added 10/06/2022
https://dart.dev/tools/diagnostic-messages?utm_source=dartdev&utm_medium=redir&utm_id=diagcode&utm_content=static_access_to_instance_member#static_access_to_instance_member
Helped with learning about static method reference in login, great resource
added login/registration 10/06/2022
*/