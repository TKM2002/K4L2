import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:knights4love2/main.dart';
import 'package:knights4love2/User.dart';
import 'Dashboard.dart';

//Login screen layout
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Login'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            const Spacer(
              flex: 1,
            ),

            //Username
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),

            //Password
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            //Login
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
                    //Set up user variables in user class
                    //Might need to put in other stuff like answers
                    User.username = username.text;
                    if (Homepage.user.contains(username.text) &&
                        Homepage.pass[Homepage.user.indexOf(username.text)] ==
                            password.text) {
                      DocumentReference user = FirebaseFirestore.instance
                          .collection('users')
                          .doc(username.text);
                      user.get().then((element) => {
                            User.setFirst(element.get("firstname")),
                            User.setLast(element.get("lastname")),
                            User.setAge(element.get("age")),
                            User.setDesc(element.get("description")),
                            User.setPic(element.get("picURL"))
                          });
                      user.collection('matches').doc('Match01').get().then(
                          (value) => User.Matches[0] = value.get('username'));
                      user.collection('matches').doc('Match02').get().then(
                          (value) => User.Matches[1] = value.get('username'));
                      user.collection('matches').doc('Match03').get().then(
                          (value) => User.Matches[2] = value.get('username'));
                      final timer = Timer(const Duration(seconds: 2), () {
                        User.addMessageSlots();
                      });

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                          (Route<dynamic> route) => false);
                    } else {
                      print("Bad login");
                    }
                  },
                  child: const Text(
                    'Login',
                    textScaleFactor: 1.5,
                  ),
                )),
            const Spacer(
              flex: 2,
            ),
          ]),
        ));
  }
}
