import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/model/user.dart';
import 'package:basic_flutter/User/ui/widgets/profile_background.dart';
import 'package:basic_flutter/User/ui/screens/profile_header.dart';
import 'package:basic_flutter/User/ui/widgets/profile_places_list.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileTrips extends StatelessWidget {
  const ProfileTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.done:
          case ConnectionState.active:
            return showProfileData(snapshot);
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return CircularProgressIndicator();
    } else {
      User user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoUrl: snapshot.data.photoURL,
      );
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[ProfileHeader(user: user,), ProfilePlacesList(user: user,)],
          )
        ],
      );
    }
  }
}
