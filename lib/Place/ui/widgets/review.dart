import 'package:basic_flutter/widgets/stars.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final String pathImage;
  final String name;
  final String details;
  final String comment;

  const Review(this.pathImage, this.name, this.details, this.comment,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userComment = Container(
      margin: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 13.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
    
    final userInfoStars = Row(children: <Widget>[
      Container(
        margin: const EdgeInsets.only(
          left: 20.0,
        ),
        child: Text(
          details,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
            color: Color(0xFFa3a5a7),
          ),
        ),
      ),
      const Stars(13.0, 0.0),
      ],
    );

    final userName = Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 17.0,
        ),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfoStars,
        userComment
      ],
    );

    final photo = Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20.0,
        right: 20.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage),
        ),
      ),
    );

    return Row(
      children: <Widget>[
        photo,
        userDetails,
      ],
    );
  }
}
