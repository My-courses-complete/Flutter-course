import 'package:basic_flutter/Place/ui/widgets/card_image_list.dart';
import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/model/user.dart';
import 'package:basic_flutter/widgets/gradient_back.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:
            return showPlacesData(snapshot);
          case ConnectionState.none:
          case ConnectionState.waiting:
          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  Widget showPlacesData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: <Widget>[GradientBack(), Text("Usuario no logeado")],
      );
    } else {
      User user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoUrl: snapshot.data.photoURL,
      );

      return Stack(
        children: <Widget>[
          GradientBack(height: 300),
          CardImageList(user: user),
        ],
      );
    }
  }
}
