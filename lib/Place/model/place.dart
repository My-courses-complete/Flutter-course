import 'package:basic_flutter/User/model/user.dart';
import 'package:flutter/material.dart';

class Place {
  String id;
  String name;
  String description;
  String uriImage;
  int likes;
  bool liked;
  // User userOwner;

  Place({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    required this.uriImage,
    required this.likes,
    this.liked = false,
    // required this.userOwner,
  });
}
