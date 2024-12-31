import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/providers/providers.dart';
import 'package:todo/widgets/custom_filled_button.dart';
import 'package:todo/providers/completed_providers.dart';

class TaskBoxContent extends ConsumerWidget {
  final int taskIndex;

  const TaskBoxContent({super.key, required this.taskIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);

    if (taskIndex < 0 || taskIndex >= taskList.length) {
      return Center(
        child: null
      );
    };

    final task = taskList[taskIndex];

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        spacing: 20,
        children: [
          Center(
            child: Container(
              height: 12,
              width: 65,
              decoration: BoxDecoration(
                color: const Color(0xFFE8E8E8),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Text(
            task['title'] ?? 'No date',
            style: const TextStyle(
              fontFamily: 'Poppins-Bold',
              fontSize: 23,
            ),
          ),
          //show user nd date & time
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'End date',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    task['date'] ?? 'No title',
                    style: const TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'End date',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    task['time'] ?? 'No time',
                    style: const TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 14,
                    ),
                  ),
                ],
                
              ),
            ],
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
        
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  task['note'] ?? 'No note',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          
          Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomFilledButton(
                buttontext: 'Delete', 
                onPressed: () {
                  Navigator.of(context).pop();
                  if (taskIndex == 0) {
                    ref.read(taskListProvider.notifier).removeTask(taskIndex);
                  } else {
                    ref.read(taskListProvider.notifier).removeTask(taskIndex);
                  }
                },
                buttonColor: Color(0xFFFF3333),),
              CustomFilledButton(buttontext: 'Task Done', onPressed: () {
                Navigator.of(context).pop();
                if (taskIndex == 0) {
                    ref.read(taskListProvider.notifier).removeTask(taskIndex);
                  } else {
                    ref.read(taskListProvider.notifier).removeTask(taskIndex);
                  }
                ref.read(completedListProvider.notifier).addCompletedTask({'title': task['title'] ?? 'notask'});
              }, buttonColor: Color(0xFF0EAEE4),),
            ],
          ),
          
          // Add more task-specific details here
        ],
      ),
    );
  }
}
