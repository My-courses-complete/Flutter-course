import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String imgProfile;
  final String name;
  final String email;

  const UserInfo(this.imgProfile, this.name, this.email, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userPhoto = Container(
      width: 90.0,
      height: 90.0,
      margin: EdgeInsets.only(
        right: 20.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.white,
          style: BorderStyle.solid,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imgProfile),
        ),
      ),
    );

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            bottom: 5.0,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          email,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 0.0,
      ),
      child: Row(
        children: <Widget>[
          userPhoto,
          userInfo,
        ],
      ),
    );
  }
}
