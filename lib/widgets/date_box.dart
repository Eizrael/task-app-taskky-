import 'package:flutter/material.dart';
class DateBox extends StatelessWidget {
  final String label;
  final String date;
  final VoidCallback onPressed;

  const DateBox({
    super.key, required this.label, required this.date, required this.onPressed
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFE9E9E9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xFF808080),
                ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFF0EAEE4),
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}