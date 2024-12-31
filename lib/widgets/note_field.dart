import 'package:flutter/material.dart';

class NoteField extends StatefulWidget {
  final String textHint;
  final TextEditingController controller;

  const NoteField({Key? key, required this.textHint, required this.controller}) : super(key: key);

  @override
  State<NoteField> createState() => _NoteFieldState();
}

class _NoteFieldState extends State<NoteField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 100,  // Adjust the height as needed
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.textHint,
          hintStyle: const TextStyle(
            color: Color(0xFF808080),
            fontFamily: "Poppins",
            fontSize: 14,
          ),
          border: InputBorder.none,  // Removes the default border
        ),
        style: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          color: Color(0xFF000000),
        ),
        maxLines: null,               // Makes the TextField wrap text
        expands: true,                // Expands to fit the parent container
        textAlignVertical: TextAlignVertical.top,  // Aligns text at the top
      ),
    );
  }
}
