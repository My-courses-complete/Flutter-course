import 'package:basic_flutter/User/model/user.dart';
import 'package:flutter/material.dart';

class Place {
  String id;
  String name;
  String description;
  String uriImage;
  int likes;
  User userOwner;

  Place({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    required this.uriImage,
    this.likes = 0,
    required this.userOwner,
  });
}
