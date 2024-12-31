// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String buttontext;
  final VoidCallback onPressed;
  final Color buttonColor;

  const CustomFilledButton({
    Key? key,
    required this.buttontext,
    required this.onPressed,
    this.buttonColor = const Color(0xFF333333),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: Size(310, 50),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13)
        )
      ),
      child: Text(
        buttontext,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
        ),
      )
    );
  }
}
