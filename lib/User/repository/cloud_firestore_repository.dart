import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/Place/ui/widgets/card_image.dart';
import 'package:basic_flutter/User/model/user.dart' as Model;
import 'package:basic_flutter/User/repository/cloud_firestore_api.dart';
import 'package:basic_flutter/User/ui/widgets/profile_place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();
  void updateUserDataFirestore(Model.User user) async =>
      _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceDataFirestore(Place place) async =>
      _cloudFirestoreAPI.updatePlaceData(place);
  Stream<QuerySnapshot> placesListStream() =>
      _cloudFirestoreAPI.placesListStream();
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> querySnapshot) =>
      _cloudFirestoreAPI.buildMyPlaces(querySnapshot);
  Stream<QuerySnapshot> getPlacesListStreamByUserId(String uid) =>
      _cloudFirestoreAPI.getPlacesListStreamByUserId(uid);
  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, Model.User user) =>
      _cloudFirestoreAPI.buildPlaces(placesListSnapshot, user);
  Future likePlace(Place place, String userId) =>
      _cloudFirestoreAPI.likePlace(place, userId);
}
