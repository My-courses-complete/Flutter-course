import 'package:basic_flutter/widgets/gradient_back.dart';
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
            ],
          )
        ],
      ),
    );
  }
}
