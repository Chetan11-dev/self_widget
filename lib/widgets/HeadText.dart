import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadText extends StatelessWidget {
  final String msg;
  const HeadText({Key key, this.msg = "Hello"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      msg,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400, letterSpacing: 5, fontSize: 30),
    );
  }
}

class BiggerHeadText extends StatelessWidget {
  final String msg;
  const BiggerHeadText({Key key, this.msg = "Hello"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      msg,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        fontSize: 45,
      ),
    );
  }
}

class SmallerHeadText extends StatelessWidget {
  final String msg;
  const SmallerHeadText({Key key, this.msg = "Hello"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      msg,
      style: GoogleFonts.poppins(
        fontSize: 20,
      ),
    );
  }
}
