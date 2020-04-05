import 'package:flutter/material.dart';

class BuildHorizontalLine extends StatelessWidget {
  final String message;

  const BuildHorizontalLine({ Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 1.0,
              color: Colors.black26.withOpacity(.2),
            ),
          ),
        ),
        Text(message),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 1.0,
              color: Colors.black26.withOpacity(.2),
            ),
          ),
        ),
      ],
    );
  }
}