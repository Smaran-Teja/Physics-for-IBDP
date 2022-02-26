import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'Authenticate/authenticate.dart';
import 'Home/home.dart';

// ignore: use_key_in_widget_constructors
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<User?>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      //return Authenticate();
      return Home();
    }
  }
}
