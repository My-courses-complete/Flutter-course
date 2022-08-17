import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/ui/widgets/button_bar.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/User/ui/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

  return StreamBuilder(
    stream: userBloc.streamFirebase,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return CircularProgressIndicator();
        case ConnectionState.none:
          return CircularProgressIndicator();
        case ConnectionState.active:
          return UserInfo(snapshot.data);
        case ConnectionState.done:
          return UserInfo(snapshot.data);
        default:
          return CircularProgressIndicator();
      }
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      return UserInfo(snapshot.data);
    }, 
  );

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

  Widget ShowProfileData (AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No login");
      return CircularProgressIndicator();
    } else {
      return UserInfo(snapshot.data);
    }
  }
}
