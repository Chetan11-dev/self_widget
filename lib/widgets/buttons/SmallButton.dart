import 'package:flutter/material.dart';
import 'package:self_widget/widgets/Animated/BouncyBouncy.dart';

class SmallButton extends StatelessWidget {
  final Color textColor, bgColor;
  final String message;
  const SmallButton(
      {Key key, this.textColor, this.message = 'Lets Go', this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
