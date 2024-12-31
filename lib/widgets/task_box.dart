import 'package:flutter/material.dart';

class TaskBox extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String dateTimeLabel;
  
  const TaskBox({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.dateTimeLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 18,
                    ),
                  ),      
                  Text(
                    dateTimeLabel,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xFF808080),
                    ),
                  )
                ],
              ),
          
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_forward_ios_rounded, color:Color(0xFF3988EB), size: 30,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
