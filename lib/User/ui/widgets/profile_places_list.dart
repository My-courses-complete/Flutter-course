import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/model/user.dart';
import 'package:basic_flutter/User/ui/widgets/profile_place.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfilePlacesList extends StatelessWidget {
  final User user;
  const ProfilePlacesList({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 20.0,
          right: 20.0,
        ),
        child: StreamBuilder(
          stream: userBloc.getPlacesListStreamByUserId(user.uid),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                return Column(
                    children: userBloc.buildMyPlaces(snapshot.data.docs));
              case ConnectionState.active:
                return Column(
                    children: userBloc.buildMyPlaces(snapshot.data.docs));
              case ConnectionState.none:
                return CircularProgressIndicator();
              default:
                return CircularProgressIndicator();
            }
          },
        ));
  }
}
