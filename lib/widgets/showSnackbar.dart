import 'package:flutter/material.dart';

class BuildSnackBar extends StatelessWidget {
  final String message;

  const BuildSnackBar({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((Duration d) {
      print(d.inMilliseconds);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ));
    });

    return const SizedBox();

    // return Flushbar(
    //     message: message,
    //     margin: EdgeInsets.all(8),
    //     borderRadius: 8,
    //     duration: Duration(seconds: 3),
    //     flushbarStyle: FlushbarStyle.FLOATING)
    //   ..show(context);
  }
}
