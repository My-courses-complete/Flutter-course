import 'package:basic_flutter/widgets/button_purple.dart';
import 'package:basic_flutter/widgets/stars.dart';
import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget {
  final String namePlace;
  final int stars;
  final String descriptionPlace;

  const DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace, {Key? key}) : super(key: key);
  final String descriptionDummy =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    final description = Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20.0,
        right: 20.0,
      ),
      child: Text(
        descriptionPlace,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );

    final titleStars = Row(children: <Widget>[
      Container(
        margin: const EdgeInsets.only(
          top: 320.0,
          left: 20.0,
        ),
        child: Text(
          namePlace,
          style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      const Stars(18.0, 323.0),
    ]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titleStars,
        description,
        ButtonPurple()
      ],
    );
  }
}
