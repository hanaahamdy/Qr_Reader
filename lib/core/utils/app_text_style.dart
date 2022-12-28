import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double? fontsize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final String text;
  final TextAlign? textAlign;

  const AppText(
      {this.fontsize, this.textColor, this.fontWeight,this.textAlign, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: fontWeight, fontSize: fontsize, color: textColor),
    );
  }
}
