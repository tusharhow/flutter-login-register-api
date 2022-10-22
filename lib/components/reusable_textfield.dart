import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  
  const InputTextFieldWidget(this.textEditingController, this.hintText,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        filled: true,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        fillColor: Colors.black12,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black38),
        contentPadding: const EdgeInsets.only(left: 10),
        focusColor: Colors.white60,
      ),
    );
  }
}
