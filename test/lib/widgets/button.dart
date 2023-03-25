import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  //const Button({super.key});

  final String text;
  final Color backgroundColor;
  final Color textColor;

  const Button(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(20)),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 40,
          ),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
