import 'package:flutter/material.dart';
import 'package:self_widget/self_widget.dart';

class SmallBouncyButton extends StatelessWidget {
  final Color textColor, bgColor;
  final String message;
  final VoidCallback onTap;
  const SmallBouncyButton(
      {Key key,
      this.textColor,
      this.message = 'Lets Go',
      this.bgColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncyBouncy(
        onTap: onTap,
        child: SmallButton(
          bgColor: bgColor,
          message: message,
          textColor: textColor,
        ));
  }
}
