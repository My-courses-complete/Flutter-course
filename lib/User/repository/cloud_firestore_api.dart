import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/Place/ui/widgets/card_image.dart';
import 'package:basic_flutter/User/model/user.dart' as Model;
import 'package:basic_flutter/User/ui/widgets/profile_place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CloudFirestoreAPI {
  final String USERS = 'users';
  final String PLACES = 'places';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  void updateUserData(Model.User user) async {
    CollectionReference users = _db.collection(USERS);

    DocumentReference ref = users.doc(user.uid);

    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'myPlaces': user.myPlaces,
      'favoritePlaces': user.favoritePlaces,
      'lastSignIn': DateTime.now(),
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference places = _db.collection(PLACES);
    String uid = (await _auth.currentUser!).uid;
    return places.add({
      'name': place.name,
      'description': place.description,
      'urlImage': place.uriImage,
      'likes': place.likes,
      'userOwner': _db.doc('$USERS/$uid'),
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        DocumentReference refUsers = _db.collection(USERS).doc(uid);
        refUsers.update({
          'myPlaces':
              FieldValue.arrayUnion([_db.doc("$PLACES/${snapshot.id}")]),
        });
      });
    });
  }

  Stream<QuerySnapshot> placesListStream() {
    return _db.collection(PLACES).snapshots();
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = <ProfilePlace>[];
    placesListSnapshot.forEach((p) {
      profilePlaces.add(ProfilePlace(
        Place(
          name: p['name'],
          description: p['description'],
          uriImage: p['urlImage'],
          likes: p['likes'],
          id: p.id,
        ),
      ));
    });
    return profilePlaces;
  }

  Stream<QuerySnapshot> getPlacesListStreamByUserId(String uid) {
    return _db
        .collection(PLACES)
        .where('userOwner', isEqualTo: _db.doc('$USERS/$uid'))
        .snapshots();
  }

  List<Place> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot, Model.User user) {
    List<Place> places = <Place>[];

    placesListSnapshot.forEach((p) {
      Place place = Place(
          id: p.id,
          name: p["name"],
          description: p["description"],
          uriImage: p["urlImage"],
          likes: p["likes"]);
          final data = p.data() as Map<String, dynamic>;
      List usersLikedRefs = data.containsKey('usersLiked')
          ? p['usersLiked'] as List
          : [];
      place.liked = false;
      usersLikedRefs.forEach((userRef) {
        if (userRef.id == user.uid) {
          place.liked = true;
        }
      });
      places.add(place);
    });
    return places;
  }

  Future likePlace(Place place, String uid) async {
    await _db
        .collection(PLACES)
        .doc(place.id)
        .get()
        .then((DocumentSnapshot ds) {
      int likes = ds["likes"];

      _db.collection(PLACES).doc(place.id).update({
        'likes': place.liked ? likes + 1 : likes - 1,
        'usersLiked': place.liked
            ? FieldValue.arrayUnion([_db.doc("${USERS}/${uid}")])
            : FieldValue.arrayRemove([_db.doc("${USERS}/${uid}")])
      });
    });
  }
}
