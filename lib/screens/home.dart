import 'package:flutter/material.dart';
import 'package:todo/screens/add_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/screens/task_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaskList(),
      backgroundColor: Color(0xFFFEFEFE),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: 55,
            width: 55,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF333333),
              
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return AnimatedPadding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      duration: const Duration(milliseconds: 300),
                      child: AddTask(),
                    );
                  },
                );
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                color: Color(0xFFFEFEFE),
                borderRadius: BorderRadius.circular(100)
              ),
                child: Icon(
                  CupertinoIcons.plus,
                  size: 35,
                  color: Color(0xFF0EAEE4),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
