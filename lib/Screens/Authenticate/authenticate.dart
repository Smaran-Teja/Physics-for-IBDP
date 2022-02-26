import 'package:physics_for_ibdp/Screens/Authenticate/login.dart';
import 'package:physics_for_ibdp/Screens/Authenticate/register.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = false;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
