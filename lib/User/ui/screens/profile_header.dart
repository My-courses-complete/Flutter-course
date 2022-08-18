import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/model/user.dart';
import 'package:basic_flutter/User/ui/widgets/button_bar.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/User/ui/widgets/user_info.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

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
          return ShowProfileData(snapshot);
        case ConnectionState.done:
          return ShowProfileData(snapshot);
        default:
          return CircularProgressIndicator();
      }
    }, 
  );

    
  }

  Widget ShowProfileData (AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: EdgeInsets.only(
          top: 50.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la informacion")
          ]
        ),
      );
    } else {
      print(snapshot.data);
      final User user = User(uid: snapshot.data.uid, name: snapshot.data.displayName, email: snapshot.data.email, photoUrl: snapshot.data.photoURL);
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
}
