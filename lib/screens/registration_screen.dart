import 'package:flutter/material.dart';
import '../kconstants.dart';
import '../components/text_field_widget.dart';
import '../components/log_reg_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = "registrationScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: "logo",
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/SandeshLogo.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: Center(
                  child: Text(
                    "Register",
                    style: kCredTextStyle,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFieldWidget(
                      hintText: "Enter Your Email",
                      colour: Color(0xFF20E676),
                      isInteractive: true,
                      onChange: (value) {
                        email = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextFieldWidget(
                        hintText: "Enter Your Password",
                        colour: Color(0xFF20E676),
                        isHidden: true,
                        onChange: (value) {
                          password = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: LogRegButton(
                  labelText: "Register",
                  onPress: () async {
                    setState(() {
                      spinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        spinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  colour: Colors.pinkAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
