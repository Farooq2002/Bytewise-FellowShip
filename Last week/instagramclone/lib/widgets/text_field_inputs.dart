import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool isPass;
  final TextInputType textInputType;

  const TextInputField(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.textInputType,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isPass,
      decoration: InputDecoration(
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          hintText: hintText,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
          border: inputBorder),
    );
  }
}
