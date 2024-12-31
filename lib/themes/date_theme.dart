import 'package:flutter/material.dart';

ThemeData customDatePickerTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFF333333), // OK and CANCEL button colors
        textStyle: TextStyle(
          fontFamily: 'Poppins', // Custom font for buttons
          fontSize: 18, // Font size for the button text
        ),
      ),
    ),
    // Customizing the background color of the Date Picker dialog
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),//Color(0xFFEBEBEB)), // Border color for the input fields
      ),
    ),
    // Customize the calendar grid, weekday labels, and day styles
    
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red, // Button color for the selected date
    ),
    
  );
}
