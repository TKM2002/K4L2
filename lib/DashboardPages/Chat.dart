//https://firebase.google.com/docs/web/setup?authuser=0&hl=en
//Shows how to access db once its working

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:knights4love2/User.dart';
import 'MessageTemplate.dart';

class Chat extends StatefulWidget {
  static List<ChatMessage> messageList = [];
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  static Future<void> loadMessages() {
    //Load in current messages from subcollection using User.curMatchName
    users
        .doc(User.username)
        .collection('messages')
        .doc(User.curMatchPage)
        .collection('matchConvo')
        .orderBy('time')
        .get()
        .then((value) => value.docs.forEach((element) {
              Chat.messageList.add(ChatMessage(
                  messageContent: element.get('message'),
                  messageType: element.get('type')));
            }));

    return Future.delayed(
        const Duration(seconds: 2), () => print('Loading messages...'));
  }

  //adds whatever is in the text box to the message list
  static void addMessage(String message) {
    //Add message to the database
    Chat.users
        .doc(User.username)
        .collection('messages')
        .doc(User.curMatchPage)
        .collection('matchConvo')
        .doc()
        .set({'message': message, 'time': Timestamp.now(), 'type': "sender"});
    Chat.users
        .doc(User.curMatchPage)
        .collection('messages')
        .doc(User.username)
        .collection('matchConvo')
        .doc()
        .set({'message': message, 'time': Timestamp.now(), 'type': "receiver"});
  }

  Chat({super.key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
//https://firebase.flutter.dev/docs/database/read-and-write/#read-data

  String temp = "";
  @override
  Widget build(BuildContext context) {
    TextEditingController message = TextEditingController(text: temp);
    //listen to our database, if it changes call setState()
    final t = Chat.users
        .doc(User.username)
        .collection('messages')
        .doc(User.curMatchPage)
        .collection('matchConvo')
        .snapshots()
        .listen((event) {
      for (var change in event.docChanges) {
        if (change.type == DocumentChangeType.added) {
          Chat.messageList.add(ChatMessage(
              messageContent: change.doc.get('message'),
              messageType: change.doc.get('type')));
        }
      }
      print(Chat.messageList.length);
    });
    setState(() {});
    t.cancel();
    return Scaffold(
      appBar: AppBar(
        title: Text(User.curMatchPage),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 65),
            scrollDirection: Axis.vertical,
            itemCount: Chat.messageList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (Chat.messageList[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (Chat.messageList[index].messageType == "receiver"
                          ? const Color.fromARGB(255, 173, 158, 24)
                          : const Color.fromARGB(255, 180, 17, 17)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      Chat.messageList[index].messageContent,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: message,
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () => {
                      if (message.text != "")
                        {
                          //Refresh chat page, might not need this with event listener but
                          //it could be a lot faster so maybe keep for reactivity
                          setState(() => Chat.messageList.add(ChatMessage(
                              messageContent: message.text,
                              messageType: "sender"))),
                          Chat.addMessage(message.text),
                        }
                    },
                    backgroundColor: const Color.fromARGB(255, 180, 17, 17),
                    elevation: 0,
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Add a message, and how to use toString with database stuff
/*
  final message = FirebaseFirestore.instance
      .collection('users')
      .doc('aly')
      .collection('messages')
      .doc('message1')
      .get()
      .then(
    (DocumentSnapshot doc) {
//distinguish bewteen variables or parse string
      final data = doc.data().toString();
      print(data);
      _ChatState.addMessage(data);
    },
  );
*/