import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:physics_for_ibdp/Models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(String name, bool hl) async {
    if (name == "a" || uid == "a") {
      return await userCollection.doc(uid).set({
        // enter other updates here
      }, SetOptions(merge: true));
    } else {
      return await userCollection
          .doc(name)
          .set({'uid': uid, 'hl': hl, 'name': name});
    }
  }

  // user data from snapshots
  List<UserData> _userDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserData(
        uid: doc['uid'],
        name: doc['name'],
        hl: doc['hl'],
      );
    }).toList();
  }

  // get user doc stream
  Stream<List<UserData?>> get userDataList {
    return userCollection.snapshots().map(_userDataFromSnapshot);
  }
}
