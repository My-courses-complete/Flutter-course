import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/User/ui/widgets/profile_place_info.dart';
import 'package:flutter/material.dart';

class ProfilePlace extends StatelessWidget {
  final Place place;

  const ProfilePlace(this.place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoCard = Container(
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 70.0,
      ),
      height: 220.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(place.uriImage),
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
    );

    return Stack(
      alignment: Alignment(0.0, 0.8),
      children: <Widget>[
        photoCard,
        ProfilePlaceInfo(place)
      ],
    );
  }
}
