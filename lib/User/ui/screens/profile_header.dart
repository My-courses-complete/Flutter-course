import 'package:basic_flutter/User/ui/widgets/button_bar.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/User/ui/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Text(
      'Profile',
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );

    return Container(
      margin: EdgeInsets.only(
        top: 50.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[title],
          ),
          UserInfo('assets/img/profile.jpg', 'Jesus Mejia','chucho4720013@gmail.com'),
          ButtonsBar()
        ],
      ),
    );
  }
}
