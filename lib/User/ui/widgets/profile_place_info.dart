import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/widgets/floating_action_button_green.dart';
import 'package:flutter/material.dart';

class ProfilePlaceInfo extends StatelessWidget {
  final Place place;

  const ProfilePlaceInfo(this.place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final place = Text(
      this.place.name,
      style: TextStyle(
        fontFamily: "Lato",
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final placeInfo = Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.place.description,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 16.0,
              color: Color.fromRGBO(0, 0, 0, 0.4),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            this.place.description,
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              fontWeight: FontWeight.bold,
              fontFamily: "Lato",
              fontSize: 16.0,
            ),
          ),
        ],
      )
    );

    final steps = Text(
      'Likes ${this.place.likes}',
      style: TextStyle(
        fontFamily: "Lato",
        fontSize: 14.0,
        color: Colors.amber,
        fontWeight: FontWeight.bold,
      ),
    );

    final card = Container(
      width: screenWidth * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(
          15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            place,
            placeInfo,
            steps,
          ],
        ),
      ),
    );

    return Stack(
      alignment: Alignment(0.8, 1.25),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(),
      ],
    );
  }
}
