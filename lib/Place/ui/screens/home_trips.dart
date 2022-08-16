import 'package:basic_flutter/Place/ui/widgets/description_place.dart';
import 'package:basic_flutter/Place/ui/screens/header_appbar.dart';
import 'package:basic_flutter/Place/ui/widgets/review_list.dart';
import 'package:flutter/material.dart';

class HomeTrips extends StatelessWidget {
  const HomeTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: const <Widget>[
              DescriptionPlace("Paisajes", 4,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              ReviewList(),
            ],
          ),
          HeaderAppBar(),
        ],
      ),
    );
  }
}
