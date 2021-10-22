import 'package:flutter/material.dart';

import 'input_validator.dart';

class TextAreaField extends StatelessWidget {
  final String fallbackMessage;
  final void Function(String) onChange;
  final int maxLines;

  TextAreaField(
      {required this.fallbackMessage,
      required this.onChange,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      onChanged: onChange,
      validator: (value) =>
          InputValidator(value!).nonEmpty(fallbackMessage).validate(),
    );
  }
}
