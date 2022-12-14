import 'dart:io';
import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/Place/ui/widgets/card_image.dart';
import 'package:basic_flutter/Place/ui/widgets/title_input_location.dart';
import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/model/user.dart' as Model;
import 'package:basic_flutter/widgets/button_purple.dart';
import 'package:basic_flutter/widgets/gradient_back.dart';
import 'package:basic_flutter/widgets/text_input.dart';
import 'package:basic_flutter/widgets/title_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  XFile image;

  AddPlaceScreen({
    Key? key,
    required this.image,
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
                        pathImage: widget.image.path,
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
                        User user = userBloc.currentUser;
                        if (user == null) {
                          return;
                        }
                        userBloc
                            .uploadFile(
                                "${user.uid}/${DateTime.now().toString()}.jpg",
                                File(widget.image.path))
                            .then((UploadTask uploadTask) {
                          uploadTask.then((TaskSnapshot snapshot) {
                            snapshot.ref.getDownloadURL().then((urlImage) {
                              print("Urlimage: $urlImage");
                              userBloc
                                .updatePlaceData(Place(
                                  name: _controllerTitlePlace.text,
                                  description: _controllerDescriptionPlace.text,
                                  likes: 0,
                                  uriImage: urlImage,
                                  id: "1",
                                ))
                                .whenComplete(() {
                                  print("Termino");
                                  Navigator.pop(context);
                                });
                            });
                          });
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
