import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../User.dart';
import 'Chat.dart';

class ChatList extends StatefulWidget {
  String firstName = "";
  String lastName = "";
  String percent = "";
  String url = "";

  ChatList(
      {required this.firstName,
      required this.lastName,
      required this.url /*, required this.percent*/});
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        //Pass match name into chat, set user class variable curMatchPage,
        //stores the name of the match who we need to access
        User.curMatchPage = widget.firstName;

        //Empty chat list
        Chat.messageList = [];

        //Load in current database messages
        await Chat.loadMessages();

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Chat();
        }));
        /*users
            .doc(User.curMatchPage)
            .collection('messages')
            .doc(User.username)
            .collection('matchConvo')
            .get()
            .then((value) => value.docs.forEach((element) {
                  Chat.addMessage(element.get('message'), element.get('type'));
                }));*/
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.url),
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.firstName,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(widget.lastName,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              //Percent match baby they'll never know
              widget.percent,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
