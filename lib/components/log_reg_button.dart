import 'package:flutter/material.dart';

class LogRegButton extends StatelessWidget {
  LogRegButton({this.labelText, @required this.onPress, this.colour});
  final String labelText;
  final Function onPress;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colour,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: onPress,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          labelText,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
