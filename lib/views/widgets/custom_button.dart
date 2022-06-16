import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);

  final Function() press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(text),
    );
  }
}
