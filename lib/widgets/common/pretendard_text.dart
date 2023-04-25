import 'package:flutter/material.dart';

class PText extends StatelessWidget {
  const PText(
    this.text, {
    Key? key,
    this.size,
    this.weight,
    this.color,
    this.align,
  }) : super(key: key);

  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size,
        fontFamily: 'Pretendard',
        fontWeight: weight ?? FontWeight.w800,
      ),
    );
  }
}
