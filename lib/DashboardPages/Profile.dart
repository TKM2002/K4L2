import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:knights4love2/DashboardPages/Messages.dart';
import 'package:knights4love2/DashboardPages/Settings.dart';
import '../Dashboard.dart';
import '../User.dart';

//https://medium.com/geekculture/flutter-how-to-upload-photos-taken-from-the-camera-and-other-files-via-http-386d04218e02
//https://firebase.google.com/docs/storage/web/upload-files
//Put pictures in, survey requirement?
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
    TextEditingController pic = TextEditingController(text: User.picURL);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        titleSpacing: 110,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          //use constrainedBox to enable flex inside of a singlechildscrollview
          child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(children: <Widget>[
          const Spacer(flex: 1),
          //PICTURE
          CircleAvatar(
            backgroundImage: NetworkImage(User.picURL),
            maxRadius: 100,
          ),

          const Spacer(flex: 1),

          //FIRST NAME
          TextField(
            controller: firstName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'First Name',
            ),
          ),
          const Spacer(flex: 1),
          //LAST NAME
          TextField(
            controller: lastName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Last Name',
            ),
          ),
          const Spacer(flex: 1),
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
          const Spacer(flex: 1),
          //PICTURE URL
          TextField(
            controller: pic,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Picture URL',
            ),
          ),
          const Spacer(flex: 1),
          //Save
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 180, 17, 17)),
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 224, 203, 19)),
              ),
              onPressed: () {
                CollectionReference users =
                    FirebaseFirestore.instance.collection('users');
/*
                users.doc('aly').collection("messages").doc("message1").set({
                  'words': "Epic first db message",
                  //'reciever': users.doc(User.username).get("Match01")
                });
*/
                users.doc(User.username).update({
                  'firstname': firstName.text,
                  'lastname': lastName.text,
                  'age': age.text,
                  'description': description.text,
                  'picURL': pic.text
                });
                User.setFirst(firstName.text);
                User.setLast(lastName.text);
                User.setAge(age.text);
                User.setDesc(description.text);
                User.setPic(pic.text);
              },
              child: const Text(
                'Save',
                textScaleFactor: 2.5,
              )),
          const Spacer(flex: 9),
        ]),
      )),
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
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          )),
    );
  }
}

/*How to make subcollection
https://stackoverflow.com/questions/47514419/how-to-add-subcollection-to-a-document-in-firebase-cloud-firestore

CollectionReference users =
                    FirebaseFirestore.instance.collection('users');

                users.doc('aly').collection("messages").doc("message1").set({
                  'words': "Epic first db message",
                  //'reciever': users.doc(User.username).get("Match01")
                });
*/