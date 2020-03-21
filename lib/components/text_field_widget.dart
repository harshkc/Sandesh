import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    this.hintText,
    @required this.onChange,
    this.colour,
    this.isHidden,
    this.isInteractive,
    this.controller,
  });
  final String hintText;
  final Function onChange;
  final Color colour;
  final bool isHidden;
  final bool isInteractive;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enableInteractiveSelection: isInteractive == null ? false : isInteractive,
      obscureText: isHidden == null ? false : isHidden,
      textAlign: TextAlign.center,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
