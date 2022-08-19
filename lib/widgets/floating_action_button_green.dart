import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const FloatingActionButtonGreen({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<FloatingActionButtonGreen> createState() => _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  bool _pressed = false;
 
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(
        widget.icon,
      ),
      heroTag: null,
    );
  }
}