import 'package:basic_flutter/Place/ui/widgets/card_image.dart';
import 'package:basic_flutter/Place/ui/widgets/title_input_location.dart';
import 'package:basic_flutter/widgets/gradient_back.dart';
import 'package:basic_flutter/widgets/text_input.dart';
import 'package:basic_flutter/widgets/title_header.dart';
import 'package:flutter/material.dart';

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
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    final _controllerLocationPlace = TextEditingController();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300),
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
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            padding: EdgeInsets.only(
              bottom: 20
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.image?.file.path ?? "assets/img/paisaje1.jpg",
                    height: 250.0,
                    width: 350.0,
                    left: 0,
                    onPress: () {
                      Navigator.pushNamed(context, "image_viewer");
                    },
                    iconData: Icons.add_a_photo,
                  )
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: TextInput(
                    hintText: "Title",
                    inputType: TextInputType.text,
                    controller: _controllerTitlePlace,
                  )
                ),
                TextInput(hintText: "Description", inputType: TextInputType.multiline, controller: _controllerDescriptionPlace, maxLines: 5),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: TextInputLocation(hintText: "Add Location", controller: _controllerLocationPlace, icon: Icons.location_on_outlined)
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
