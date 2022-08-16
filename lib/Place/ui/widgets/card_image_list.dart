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
          CardImage("assets/img/paisaje1.jpg"),
          CardImage("assets/img/paisaje2.jpg"),
          CardImage("assets/img/paisaje3.jpg"),
        ]
      )
    );
  }
}
