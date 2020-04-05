import 'package:flutter/material.dart';
import 'package:self_widget/self_widget.dart';

class BuildFlushBar extends StatelessWidget {
  final String message;

  const BuildFlushBar({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.
    WidgetsBinding.instance.addPostFrameCallback((Duration d) {
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
