import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:flutter/material.dart';
import '../components/log_reg_button.dart';
import '../components/text_field_widget.dart';
import '../kconstants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const id = "loginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final textEditControl = TextEditingController();
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
                    "Login",
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
                        controller: textEditControl,
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
                  labelText: "Log In",
                  onPress: () async {
                    textEditControl.clear();
                    setState(() {
                      spinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
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
