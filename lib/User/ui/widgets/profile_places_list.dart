import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/User/ui/widgets/profile_place.dart';
import 'package:flutter/material.dart';

class ProfilePlacesList extends StatelessWidget {
  const ProfilePlacesList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Place place = new Place("Montaña", "En una roca", "Phoyography", "123,123,123");
    final Place place2 = new Place("Montaña", "En una roca", "Phoyography", "123,123,123");

    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        children: <Widget>[
          ProfilePlace('assets/img/paisaje1.jpg', place),
          ProfilePlace('assets/img/paisaje2.jpg', place2),
          ProfilePlace('assets/img/paisaje3.jpg', place2),
        ],
      ),
    );
  }
}
