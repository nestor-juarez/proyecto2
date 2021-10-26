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

class TileField extends StatelessWidget {
  final String content;

  const TileField(this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(this.content, style: TextStyle(fontSize: 20)),
    );
  }
}

class MyFormField extends StatelessWidget {
  final String text;
  const MyFormField(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TileField(text),
        TextAreaField(fallbackMessage: "fallbackMessage", onChange: (a) {})
      ],
    );
  }
}
