import 'package:flutter/material.dart';

ThemeData customTimePickerTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    timePickerTheme: TimePickerThemeData(
     
      backgroundColor: Color(0xFFFEFEFE),
     
      hourMinuteTextColor: Color(0xFF333333),
      hourMinuteColor: Color(0xFFEBEBEB),
      hourMinuteTextStyle: const TextStyle(
        fontSize: 36,
        color: Color(0xFF333333),
        fontFamily: 'Poppins-Bold',
      ),
      dialBackgroundColor: Color(0xFFEBEBEB), 
      entryModeIconColor: Color(0xFF333333), 
      helpTextStyle: const TextStyle(
        fontSize: 16, 
        color: Color(0xFF333333),
        fontFamily: 'Poppins-Bold', 
      ),
      dialHandColor: Color(0xFF333333), 
      dialTextStyle: TextStyle(
        fontFamily: 'Poppins-Bold',
        fontSize: 16
      ),
      dialTextColor: Color(0xFF666666),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFF333333),
        textStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18, 
        ),
      ),
    ),
  );
}
