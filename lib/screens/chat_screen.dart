import 'package:flutter/material.dart';
import '../kconstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/MessageBubble.dart';

final _dataBase = Firestore.instance;
FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  static const id = "chatScreen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final textEditControl = TextEditingController();
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final currentUser = await _auth.currentUser();
      if (currentUser != null) {
        loggedInUser = currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Sandesh'),
        backgroundColor: Color(0xFF20E676),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        cursorColor: Colors.pinkAccent,
                        controller: textEditControl,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.0),
                    child: FlatButton(
                      onPressed: () {
                        textEditControl.clear();
                        _dataBase.collection("messages").add({
                          "text": messageText,
                          "sender": loggedInUser.email,
                          "timestamp":
                              DateTime.now().toLocal().millisecondsSinceEpoch,
                        });
                      },
                      child: kMaterialSendButton,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Message Stream for fetching messages

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _dataBase
          .collection("messages")
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.pinkAccent,
              ),
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messagesBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];
          final timeStamp = message.data['timestamp'];

          var currentSender = loggedInUser.email;
          final messageBubble = MessageBubble(
            msg: messageText,
            sender: messageSender,
            isMe: currentSender == messageSender,
          );

          messagesBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messagesBubbles,
          ),
        );
      },
    );
  }
}
