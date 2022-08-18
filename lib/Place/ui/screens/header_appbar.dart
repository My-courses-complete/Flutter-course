import 'package:basic_flutter/Place/ui/widgets/card_image_list.dart';
import 'package:basic_flutter/widgets/gradient_back.dart';
import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack(height: 250.0, title: "Bienvenido",),
        CardImageList(),
      ],
    );
  }
}
