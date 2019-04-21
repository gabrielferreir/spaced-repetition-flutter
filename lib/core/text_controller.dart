import 'package:flutter/material.dart';

class TextController extends TextEditingController {
  TextController({String text, Map<String, RegExp> translator})
      : super(text: text) {
    this.addListener(() {
      if (this.text.isNotEmpty) {
        this.dirty = true;
      }
    });
  }

  bool dirty = false;
}
