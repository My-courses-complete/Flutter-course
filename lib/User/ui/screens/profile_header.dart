import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/model/user.dart';
import 'package:basic_flutter/User/ui/widgets/button_bar.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/User/ui/widgets/user_info.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileHeader extends StatelessWidget {
  final User user;
  
  const ProfileHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

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
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );

    
  }
}
