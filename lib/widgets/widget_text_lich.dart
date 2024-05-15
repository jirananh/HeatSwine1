// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetTextList extends StatelessWidget {
  const WidgetTextList({
    Key? key,
    required this.head,
    required this.value,
  }) : super(key: key);

  final String head;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(text: head, style: TextStyle(color: Colors.red), children: [
        TextSpan(text: ' : ', style: TextStyle(color: Colors.red)),
        TextSpan(text: value, style: TextStyle(color: Colors.black)),
      ]),
    );
  }
}
