import 'package:flutter/material.dart';

import 'Chat.dart';

class ChatList extends StatefulWidget {
  String firstName = "";
  String lastName = "";
  ChatList({required this.firstName, required this.lastName});
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Chat();
        }));
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  const CircleAvatar(
                    //backgroundImage: NetworkImage(widget.imageUrl),
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
            /*Text(
              //Replace with something cooler, maybe age or chat notification?
              //If not cooler, comment out for now
              widget.firstName,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
