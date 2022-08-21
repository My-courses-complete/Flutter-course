import 'package:basic_flutter/Place/ui/screens/home_trips.dart';
import 'package:basic_flutter/User/ui/screens/profile_trips.dart';
import 'package:basic_flutter/Place/ui/screens/search_trips.dart';
import 'package:flutter/material.dart';

class AppTrips extends StatefulWidget {
  const AppTrips({Key? key}) : super(key: key);

  @override
  State<AppTrips> createState() => _AppTripsState();
}

class _AppTripsState extends State<AppTrips> {
  int indexTap = 0;
  
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetsChildren = [
      HomeTrips(),
      SearchTrips(),
      ProfileTrips(),
    ];

    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple,
        ),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
