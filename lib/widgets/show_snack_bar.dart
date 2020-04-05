import 'package:flutter/material.dart';

showSnackBar(String message, BuildContext context) =>
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ));
