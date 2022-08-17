import 'package:basic_flutter/widgets/button_green.dart';
import 'package:basic_flutter/widgets/gradient_back.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SignInGoogleUI();
  }

  Widget SignInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", double.infinity),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome", 
                style: TextStyle(
                  fontSize: 37.0, 
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lato",
                  color: Colors.white,
                  )
                ),
                ButtonGreen(text: "Login with Gmail", onPressed: () {}, height: 50.0, width: 300.0)
            ],
          )
        ]
      ),
    );
  }
}