import 'dart:io';
import 'package:basic_flutter/widgets/floating_action_button_green.dart';
import 'package:flutter/material.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final String pathImage;
  final double height;
  final double width;
  double left;
  final VoidCallback onPress;
  final IconData iconData;

  CardImageWithFabIcon({
    Key? key,
    required this.pathImage,
    required this.height,
    required this.width,
    this.left = 20,
    required this.onPress,
    required this.iconData,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        top: 80.0,
        left: left,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: pathImage.contains('assets') ? AssetImage(pathImage) : FileImage(File(pathImage)) as ImageProvider<Object> ,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0),
          ),
        ],
      ),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(icon: iconData, onPressed: onPress),
      ],
    );
  }
}
