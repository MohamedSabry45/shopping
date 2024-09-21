import 'package:flutter/material.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
    required this.text,
    required this.textButton,
    this.onPressed,
  });
  final String text, textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(text),
        TextButton(
          onPressed: onPressed,
          child: Text(textButton),
        )
      ],
    );
  }
}
