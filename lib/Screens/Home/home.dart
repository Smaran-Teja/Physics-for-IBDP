import 'package:physics_for_ibdp/Firebase Services/auth.dart';
import 'package:physics_for_ibdp/Screens/Home/dash.dart';
import 'package:physics_for_ibdp/Screens/Home/questions.dart';
import 'package:physics_for_ibdp/Screens/Home/user_list.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [const Dashboard(), UserList(), const Questions()];
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: const Text("Physics for IBDP"),
          backgroundColor: Colors.grey[900],
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                AuthService().signOut();
              },
            )
          ],
        ),
        body: pages[index],
        bottomNavigationBar: SalomonBottomBar(
          margin: const EdgeInsets.all(30),
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          items: [
            SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: Colors.orangeAccent),
            SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: const Text("Users"),
                selectedColor: Colors.redAccent),
            SalomonBottomBarItem(
                icon: const Icon(Icons.question_answer),
                title: const Text("Questions"),
                selectedColor: Colors.blueAccent)
          ],
        ));
  }
}
