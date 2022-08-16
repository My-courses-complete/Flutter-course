import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final double sizeStar;
  final double paddingTop;

  const Stars(this.sizeStar, this.paddingTop, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final starBorder = Container(
      margin: EdgeInsets.only(
        top: paddingTop,
        right: 3.0,
      ),
      child: Icon(
        Icons.star_border,
        color: const Color(0xFF56575a),
        size: sizeStar,
      ),
    );

    final starHalf = Container(
      margin: EdgeInsets.only(
        top: paddingTop,
        right: 3.0,
      ),
      child: Icon(
        Icons.star_half,
        color: const Color(0xFFf2C611),
        size: sizeStar,
      ),
    );

    final star = Container(
      margin: EdgeInsets.only(
        top: paddingTop,
        right: 3.0,
      ),
      child: Icon(
        Icons.star,
        color: const Color(0xFFf2C611),
        size: sizeStar,
      ),
    );

    return Row(
      children: <Widget>[
        star,
        star,
        star,
        starHalf,
        starBorder,
      ],
    );
  }
}
