import 'package:flutter/material.dart';

void CustomSnacbar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
