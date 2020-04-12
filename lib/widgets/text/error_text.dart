import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String error;
  const ErrorText(this.error, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Text(
        error,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),
      ),
    );
  }
}
