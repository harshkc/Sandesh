import 'package:flutter/material.dart';

const kMaterialSendButton = Material(
  color: Color(0xFF192024),
  elevation: 5.0,
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
  child: Padding(
    padding: EdgeInsets.only(
      top: 10.0,
      bottom: 10.0,
      left: 16.0,
      right: 11.0,
    ),
    child: Icon(
      Icons.send,
      size: 30.0,
      color: Colors.pinkAccent,
    ),
  ),
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF20E676), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF20E678), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.teal, width: 2.0),
  ),
);

const kCredTextStyle = TextStyle(
  fontSize: 25,
  color: Color(0xFF20E676),
  letterSpacing: 0.7,
  fontWeight: FontWeight.w400,
);

const kWelcomeTextStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w700,
  color: Colors.grey,
);
