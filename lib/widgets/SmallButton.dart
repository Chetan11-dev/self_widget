import 'package:flutter/material.dart';
import 'package:self_widget/Theme/Helpers/sbHelper.dart';
import 'package:self_widget/self_widget.dart';

class SmallButton extends StatelessWidget {
  final Color textColor, bgColor;
  final String message;
  const SmallButton(
      {Key key, this.textColor, this.message = 'Lets Go', this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: szh(10), horizontal: szw(30)),
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        message,
        style: Theme.of(context).textTheme.title.copyWith(
            color: textColor ?? Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
