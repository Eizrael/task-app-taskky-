import 'package:flutter/material.dart';

class TimeBox extends StatelessWidget {
  final String label;
  final String time;
  final VoidCallback onPressed;

  const TimeBox({
    super.key, required this.label, required this.time, required this.onPressed
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
                time,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xFF808080),
                ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.access_time_sharp,
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