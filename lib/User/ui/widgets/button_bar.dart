import 'package:basic_flutter/User/ui/widgets/circle_button.dart';
import 'package:flutter/material.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Row(
        children: <Widget>[
          CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 1)),
          CircleButton(false, Icons.add, 20.0, Color.fromRGBO(255, 255, 255, 1)),
          CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6)),
        ],
      ),
    );
  }
}
