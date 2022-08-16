import 'package:basic_flutter/User/ui/widgets/profile_background.dart';
import 'package:basic_flutter/User/ui/screens/profile_header.dart';
import 'package:basic_flutter/User/ui/widgets/profile_places_list.dart';
import 'package:flutter/material.dart';

class ProfileTrips extends StatelessWidget {
  const ProfileTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList()
          ],
        )
      ],
    );
  }
}
