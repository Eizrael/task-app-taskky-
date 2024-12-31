import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String textHint;
  final TextEditingController controller;

  const InputField({
    Key? key,  // Corrected type
    required this.textHint,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE8E8E8),
        hintText: widget.textHint,
        hintStyle: const TextStyle(
          color: Color(0xFF808080),
          fontFamily: "Poppins",
          fontSize: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: Color(0xFF000000),
      ),
    );
  }
}
