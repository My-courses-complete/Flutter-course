import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/Place/ui/widgets/card_image.dart';
import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/model/user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class CardImageList extends StatefulWidget {
  final User user;
  const CardImageList({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<CardImageList> createState() => _CardImageListState();
}

class _CardImageListState extends State<CardImageList> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      height: 350.0,
      child: StreamBuilder(
        stream: userBloc.placesListStream(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.docs, widget.user));
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }

  Widget listViewPlaces(List<Place> places) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
        place.likes = place.liked ? place.likes + 1 : place.likes - 1;
      });
    }
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((Place place) {
        return GestureDetector(
          onTap: () {
            userBloc.placeSelectedSink.add(place);
          },
          child: CardImageWithFabIcon(
            pathImage: place.uriImage, 
            height: 300.0, 
            width: 250.0, 
            onPress: () => setLiked(place), 
            iconData: place.liked ? Icons.favorite : Icons.favorite_border,
          ),
        );
      }).toList(),
    );
  }
}
