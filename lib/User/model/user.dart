import 'package:basic_flutter/Place/model/place.dart';
import 'package:flutter/material.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final List<Place> favoritePlaces;
  final List<Place>  myPlaces;

  User({
    Key? key,
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    this.favoritePlaces = const [],
    this.myPlaces = const [],
  });
}
