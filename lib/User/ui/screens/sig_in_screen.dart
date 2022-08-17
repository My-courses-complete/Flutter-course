import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/widgets/button_green.dart';
import 'package:basic_flutter/widgets/gradient_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
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
                ButtonGreen(
                  text: "Login with Gmail",
                  onPressed: () => userBloc.signIn().then((UserCredential user) => print("El usuario es ${user.user?.email}")).catchError((error) => print("Error: $error")),
                  height: 50.0,
                  width: 300.0
                )
            ],
          )
        ]
      ),
    );
  }
}