import 'package:basic_flutter/User/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudFirestoreAPI {
  final String USERS = 'users';
  final String PLACES = 'places';

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  void updateUserData(User user) async {
    CollectionReference users = _db.collection(USERS);

    DocumentReference ref = users.doc(user.uid);

    // return ref.setData({
    //   'uid': user.uid,
    //   'name': user.name,
    //   'email': user.email,
    //   'photoUrl': user.photoUrl,
    //   'myPlaces': user.myPlaces,
    //   'favoritePlaces': user.favoritePlaces,
    // }, merge: true);
  }
}