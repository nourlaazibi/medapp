import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medapp/model/user.dart';

class UserDB {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserModel user) async {
    await _userCollection.doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String id) async {
    DocumentSnapshot doc = await _userCollection.doc(id).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data() as Map<String, dynamic>?, id);
    } else {
      return null;
    }
  }

  Future<void> updateUser(UserModel user) async {
    await _userCollection.doc(user.id).update(user.toMap());
  }
}
