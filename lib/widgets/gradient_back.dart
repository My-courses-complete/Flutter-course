import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  final String title;
  double? height;

  GradientBack({
    Key? key,
    this.height,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    height ??= screenHeight;

    return Container(
      width: screenWidth,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4268D3),
            Color(0xFF584CD1),
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -0.8),
        child: Container(
          width: screenHeight,
          height: height,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            borderRadius: BorderRadius.circular(screenHeight/2),
          ),
        ),
      ),
      // child: Text(
      //   title,
      //   style: const TextStyle(
      //     color: Colors.white,
      //     fontSize: 30.0,
      //     fontFamily: 'Lato',
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
    );
  }
}
