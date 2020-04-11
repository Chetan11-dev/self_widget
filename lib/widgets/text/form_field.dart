import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputTextFormField extends StatelessWidget {
  final Color fillColor, editTextColor;
  String hinttext;
  String labelText;
  final String initialValue;
  final Validator validator;
  final OnChanged onChanged;
  final OnSaved onSaved;
  final bool autoFocus;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Widget suffixIcon;
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final bool obscureText, enabled;
  final int maxLength;

  InputTextFormField({
    Key key,
    @required this.hinttext,
    this.labelText,
    this.validator,
    this.onChanged,
    @required this.onSaved,
    this.keyboardType = TextInputType.text,
    this.autoFocus = false,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.currentFocus,
    this.nextFocus,
    this.obscureText = false,
    this.initialValue,
    this.enabled = true,
    this.maxLength,
    this.fillColor,
    this.editTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (labelText == null) {
      labelText = hinttext;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        focusNode: currentFocus,
        onSaved: onSaved,
        obscureText: obscureText,
        autofocus: autoFocus,
        keyboardType: keyboardType,
        onFieldSubmitted: (_) {
          if (nextFocus != null) {
            fieldFocusChange(context, currentFocus, nextFocus);
          }
        },
        textInputAction: textInputAction,
        initialValue: initialValue,
        enabled: enabled,
        style: editTextColor != null ? TextStyle(color: editTextColor) : null,
        maxLength: maxLength,
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          suffixIcon: suffixIcon,
          errorMaxLines: 5,
          hintText: hinttext,
          labelStyle:
              editTextColor != null ? TextStyle(color: editTextColor) : null,
          helperStyle:
              editTextColor != null ? TextStyle(color: editTextColor) : null,
          fillColor: fillColor ??
              const Color.fromARGB(
                  255, 227, 241, 251), // Colors.grey.withOpacity(0.1),
          enabledBorder: editTextColor != null
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: editTextColor),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(),
          ),
        ),
      ),
    );
  }
}

typedef Validator = String Function(String params);
typedef OnChanged = void Function(String params);
typedef OnSaved = void Function(String params);

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
