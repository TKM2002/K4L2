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
          title: const Text('Login'),
          titleSpacing: 110,
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
                  onPressed: () async {
                    //try using future builder
                    //https://stackoverflow.com/questions/57232397/flutter-future-dynamic-is-not-a-subtype-of-type-bool
                    if (await User.checkLogin(username.text, password.text)) {
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
