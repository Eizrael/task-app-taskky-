import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  final Color textColor;
  final Color bgColor;

  const TabButton({
    Key? key,
    required this.textButton,
    required this.onPressed,
    required this.textColor,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 5),
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed, 
          child: Text(
            textButton,
            style: TextStyle(
              color: textColor,
              fontFamily: 'Poppins',
              fontSize: 14
            ),
          )
        ),
      ),
    );
  }
}
