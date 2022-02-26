import 'package:physics_for_ibdp/Firebase%20Services/store.dart';
import 'package:physics_for_ibdp/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final UserData? user = Provider.of<UserData?>(context);
    return StreamBuilder<List<UserData?>>(
      stream: DatabaseService(uid: user?.uid).userDataList,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          //print("no data");
          return const SizedBox.shrink();
        } else {
          //print("data");
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              final users = snapshot.data;
              final docData = users![index];
              final String name = docData.name;
              final bool hl = docData.hl;
              String level;
              if (hl) {
                level = "HL";
              } else {
                level = "SL";
              }
              if (index == 0) {
                return Column(
                  children: [
                    SizedBox(height: height * 0.01),
                    const Text("Users",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    userItem(name, level)
                  ],
                );
              } else {
                return userItem(name, level);
              }
            },
          );
        }
      },
    );
  }
}

ListTile userItem(String name, String level) {
  return ListTile(
    leading: const Icon(Icons.person, color: Colors.redAccent),
    title: Text(
      name,
      style: const TextStyle(color: Colors.white),
    ),
    trailing: Text(
      level,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
    ),
  );
}
