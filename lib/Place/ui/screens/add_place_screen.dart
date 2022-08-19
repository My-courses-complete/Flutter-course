import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/Place/ui/widgets/card_image.dart';
import 'package:basic_flutter/Place/ui/widgets/title_input_location.dart';
import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/model/user.dart';
import 'package:basic_flutter/widgets/button_purple.dart';
import 'package:basic_flutter/widgets/gradient_back.dart';
import 'package:basic_flutter/widgets/text_input.dart';
import 'package:basic_flutter/widgets/title_header.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddPlaceScreen extends StatefulWidget {
  FileImage? image;

  AddPlaceScreen({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    final _controllerLocationPlace = TextEditingController();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300),
          Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              padding: EdgeInsets.only(bottom: 20),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      child: CardImageWithFabIcon(
                        pathImage: widget.image?.file.path ??
                            "assets/img/paisaje1.jpg",
                        height: 250.0,
                        width: 350.0,
                        left: 0,
                        onPress: () {},
                        iconData: Icons.add_a_photo,
                      )),
                  Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                      child: TextInput(
                        hintText: "Title",
                        inputType: TextInputType.text,
                        controller: _controllerTitlePlace,
                      )),
                  TextInput(
                      hintText: "Description",
                      inputType: TextInputType.multiline,
                      controller: _controllerDescriptionPlace,
                      maxLines: 5),
                  Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextInputLocation(
                          hintText: "Add Location",
                          controller: _controllerLocationPlace,
                          icon: Icons.location_on_outlined)),
                  Container(
                    width: 70,
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: ButtonPurple(
                      buttonText: "Add Place",
                      onPressed: () {
                        userBloc.updatePlaceData(Place(
                          name: _controllerTitlePlace.text,
                          description: _controllerDescriptionPlace.text,
                          likes: 0,
                          uriImage: widget.image?.file.path ??
                              "assets/img/paisaje1.jpg",
                          id: "1",
                          userOwner: User(
                            uid: "1",
                            name: "User 1",
                            email: "sc",
                            photoUrl: "assets/img/paisaje1.jpg",
                          ),
                        )).whenComplete(() {
                          print("Termino");
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                ],
              )),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 25.0,
                  left: 20,
                ),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 45.0,
                    left: 20,
                    right: 10,
                  ),
                  child: TitleHeader(
                    title: "Add a new place",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
