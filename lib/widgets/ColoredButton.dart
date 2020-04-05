import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColoredButton extends StatelessWidget {
  final double padding;

  final String msg;

  final double radius;

  final double fontSize;

  final Color color;
  const ColoredButton(
      {this.color = Colors.blueAccent,
      this.padding = 20,
      this.msg = "Hello",
      this.radius = 20,
      this.fontSize = 20,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color, color.withOpacity(0.7)]),
              borderRadius: BorderRadius.circular(radius)),
          child: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: fontSize),
          ),
        ));
  }
}
