import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({
    @required this.msg,
    @required this.sender,
    @required this.isMe,
    this.timeStamp,
  });
  final String msg;
  final String sender;
  final bool isMe;
  final timeStamp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
          Material(
            color: isMe ? Colors.pinkAccent : Color(0xFF192024),
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                msg,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
//          Text(
//            timeStamp,
//            style: TextStyle(
//              fontSize: 12.0,
//              color: Colors.grey,
//            ),
//          ),
        ],
      ),
    );
  }
}
