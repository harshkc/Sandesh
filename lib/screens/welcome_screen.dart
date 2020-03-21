import '../kconstants.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import '../components/log_reg_button.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = "welcomeScreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
//  AnimationController controller;
//  Animation animation;
//
//  @override
//  void initState() {
//    super.initState();
//    controller =
//        AnimationController(duration: Duration(seconds: 1), vsync: this);
//    animation = ColorTween(begin: Colors.blueGrey, end: Color(0xFF192024))
//        .animate(controller);
//    controller.forward();
//    controller.addListener(() {
//      setState(() {});
//    });
//  }
//
//  @override
//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF192024),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Hero(
                tag: "logo",
                child: Container(
                  child: Image.asset('images/SandeshLogo.png'),
                  height: 200.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 5.0),
              child: Center(
                child: TypewriterAnimatedTextKit(
                    text: [
                      " Quick",
                      " Secure",
                      " Personal",
                      " Your",
                    ],
                    textStyle: kWelcomeTextStyle,
                    textAlign: TextAlign.start,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
            ),
            Center(
              child: Text(
                ' Sandesh',
                style: kWelcomeTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 160.0, bottom: 20.0),
              child: LogRegButton(
                labelText: "Log In",
                onPress: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                colour: Color(0xFF20E676),
              ),
            ),
            LogRegButton(
              labelText: "Register",
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              //colour: Color(0xFFF06292),
              colour: Colors.pinkAccent,
            ),
          ],
        ),
      ),
    );
  }
}
