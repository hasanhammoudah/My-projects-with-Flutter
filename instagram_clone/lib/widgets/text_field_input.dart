import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
