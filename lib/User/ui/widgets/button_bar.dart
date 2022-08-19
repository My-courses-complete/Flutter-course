import 'package:basic_flutter/Place/ui/screens/add_place_screen.dart';
import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/ui/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Row(
        children: <Widget>[
          CircleButton(true, Icons.vpn_key, 20.0,
              Color.fromRGBO(255, 255, 255, 1), () => {}),
          CircleButton(false, Icons.add, 20.0, Color.fromRGBO(255, 255, 255, 1),
              () async {
                final picker = ImagePicker();
                final XFile? photo =  await picker.pickImage(source: ImageSource.camera);
                if (photo == null) return;
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AddPlaceScreen(image: photo)));
          }),
          CircleButton(true, Icons.exit_to_app, 20.0,
              Color.fromRGBO(255, 255, 255, 0.6), userBloc.signOut),
        ],
      ),
    );
  }
}
