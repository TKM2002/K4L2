//https://firebase.google.com/docs/web/setup?authuser=0&hl=en
//Shows how to access db once its working

import 'package:flutter/material.dart';
import 'package:knights4love2/User.dart';
import 'MessageTemplate.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatMessage> messageList = [
    ChatMessage(messageContent: 'First Message!', messageType: 'sender'),
    ChatMessage(messageContent: 'What a great message', messageType: 'receiver')
  ];

  String temp = "";

  //adds whatever is in the text box to the message list
  //currently doesn't save, but that's what db is for am I right?
  void addMessage(String message) {
    messageList
        .add(ChatMessage(messageContent: message, messageType: "sender"));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController message = TextEditingController(text: temp);

    return Scaffold(
      appBar: AppBar(
        title: Text(User.firstName),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messageList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messageList[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messageList[index].messageType == "receiver"
                          ? const Color.fromARGB(255, 173, 158, 24)
                          : const Color.fromARGB(255, 180, 17, 17)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      messageList[index].messageContent,
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
                    onPressed: () => addMessage(message.text),
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
