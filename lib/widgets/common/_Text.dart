import 'package:flutter/material.dart';

class _Text extends StatelessWidget {
  const _Text({Key? key, required String content}) : super(key: key);

  @override
  Widget build(BuildContext buildContext) {
    return Text(
      content,
      style: TextStyle(
        fontFamily: 'Cafe24',
        fontSize: 30,
        fontWeight: FontWeight.w800,
      ),
    ),;
  }
}
