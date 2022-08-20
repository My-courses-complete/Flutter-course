import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/User/model/user.dart';
import 'package:basic_flutter/User/repository/cloud_firestore_api.dart';
import 'package:basic_flutter/User/ui/widgets/profile_place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();
  void updateUserDataFirestore(User user) async =>
      _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceDataFirestore(Place place) async =>
      _cloudFirestoreAPI.updatePlaceData(place);
  Stream<QuerySnapshot> placesListStream() =>
      _cloudFirestoreAPI.placesListStream();
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> querySnapshot) =>
      _cloudFirestoreAPI.buildMyPlaces(querySnapshot);
  Stream<QuerySnapshot> getPlacesListStreamByUserId(String uid) =>
      _cloudFirestoreAPI.getPlacesListStreamByUserId(uid);
}
