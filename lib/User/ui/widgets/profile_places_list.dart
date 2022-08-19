import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/User/model/user.dart';
import 'package:basic_flutter/User/ui/widgets/profile_place.dart';
import 'package:flutter/material.dart';

class ProfilePlacesList extends StatelessWidget {
  const ProfilePlacesList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Place place = Place(
      id: '1',
      name: 'Place 1',
      description: 'Description Place 1',
      uriImage: 'assets/img/paisaje1.jpg',
      likes: 0,
      userOwner: User(
        uid: '1',
        name: 'User 1',
        email: 'sc',
        photoUrl: 'assets/img/paisaje1.jpg',
      )
    );
    final Place place2 = Place(
      id: '2',
      name: 'Place 2',
      description: 'Description Place 2',
      uriImage: 'assets/img/paisaje2.jpg',
      likes: 0,
      userOwner: User(
        uid: '1',
        name: 'User 1',
        email: 'sc',
        photoUrl: 'assets/img/paisaje1.jpg',
      )
    );

    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
          ProfilePlace(place2),
        ],
      ),
    );
  }
}
