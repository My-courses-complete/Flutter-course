import 'dart:io';

import 'package:basic_flutter/Place/repository/firebase_storage_api.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository {
  final _firebaseStorageAPI = FirebaseStorageApi();
  Future<UploadTask> uploadFile(String path, File image) async => _firebaseStorageAPI.uploadFile(path, image);
}