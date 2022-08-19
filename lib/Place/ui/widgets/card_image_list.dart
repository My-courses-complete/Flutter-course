import 'package:basic_flutter/Place/ui/widgets/card_image.dart';
import 'package:flutter/material.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(
            pathImage: "assets/img/paisaje1.jpg",
            iconData: Icons.favorite_border,
            width: 250.0,
            height: 350.0,
            onPress: () {},
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/paisaje2.jpg",
            iconData: Icons.favorite_border, 
            width: 250.0,
            height: 350.0,
            onPress: () {},
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/paisaje3.jpg",
            iconData: Icons.favorite_border, 
            width: 250.0,
            height: 350.0,
            onPress: () {},
          ),
        ]
      )
    );
  }
}
