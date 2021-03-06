import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key key,
      this.hint,
      this.keyboardType,
      this.icon = Icons.accessible,
      this.obscure = false,
      this.validator,
      this.controller})
      : super(key: key);
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator validator;
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        validator: validator,
        style: TextStyle(color: primaryColor),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: primaryColor,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(20),
            hintText: hint,
            errorMaxLines: 1,
            labelStyle: TextStyle(color: primaryColor),
            hintStyle: TextStyle(color: primaryColor)),
      ),
    );
  }
}
