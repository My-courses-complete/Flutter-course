import 'dart:io';

import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/Place/repository/firebase_storage_repository.dart';
import 'package:basic_flutter/User/model/user.dart' as Model;
import 'package:basic_flutter/User/repository/auth_repository.dart';
import 'package:basic_flutter/User/repository/cloud_firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc extends Bloc {
  final _auth_repository = AuthRepository();

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  User get currentUser => FirebaseAuth.instance.currentUser!;

  Future<UserCredential> signIn() async {
    return await _auth_repository.signInFirebase();
  }

  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(Model.User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceDataFirestore(place);
  Stream<QuerySnapshot> placesListStream() => _cloudFirestoreRepository.placesListStream();

  final _firebaseStorageARepository = FirebaseStorageRepository();
  Future<UploadTask> uploadFile(String path, File image) => _firebaseStorageARepository.uploadFile(path, image);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
