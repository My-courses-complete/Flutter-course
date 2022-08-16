import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Review("assets/img/profile.jpg", "Varuna Yasas", "1 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Review("assets/img/profile.jpg", "Apurva Patel", "1 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Review("assets/img/profile.jpg", "Apurva Patel", "1 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Review("assets/img/profile.jpg", "Apurva Patel", "1 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Review("assets/img/profile.jpg", "Apurva Patel", "1 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Review("assets/img/profile.jpg", "Apurva Patel", "1 review · 5 photos", "There is an amazing place in Sri Lanka"),
      ]
    );
  }
}
