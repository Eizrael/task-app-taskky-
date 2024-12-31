import 'package:flutter/material.dart';
import 'package:todo/widgets/completed_box.dart';
import 'package:todo/widgets/tab_button.dart';
import 'package:todo/widgets/task_box.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/providers/providers.dart';
import 'package:todo/providers/completed_providers.dart';
import 'package:todo/widgets/task_box_content_container.dart';

class TaskList extends ConsumerStatefulWidget {
  const TaskList({super.key});

  @override
  ConsumerState<TaskList> createState() => _TaskListState();
}

class _TaskListState extends ConsumerState<TaskList> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _taskClicked (int taskIndex) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return TaskBoxContent(taskIndex: taskIndex,);
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskList = ref.watch(taskListProvider); 
    final completedList = ref.watch(completedListProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Taskky',
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 25,
                color: Color(0xFF333333),
              ),
            ),
            
            Container (
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFE8E8E8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  TabButton(textButton: 'Your task',
                    onPressed: () {_tabController.animateTo(0);},
                    textColor: _currentIndex == 0 ? Color(0xFFFFFFFF) : Color(0xFF333333),
                    bgColor: _currentIndex == 0 ? Color(0xFF333333) :  Color(0xFFFFFFFF),
                  ),

                  TabButton(textButton: 'Completed',
                    onPressed: () {_tabController.animateTo(1);},
                    textColor: _currentIndex == 1 ? Color(0xFFFFFFFF) : Color(0xFF333333),
                    bgColor: _currentIndex == 1 ? Color(0xFF333333) :  Color(0xFFFFFFFF),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  taskList.isEmpty ?
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'No current task, Add new one',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins-Bold',
                            fontSize: 25,
                            color: Color(0xFFD0D0D0)
                          ),
                        ),
                      )
                    ) : 
                    ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        return TaskBox(label: taskList[index]['title'] ?? 'No title', onPressed: () =>_taskClicked (index), dateTimeLabel: taskList[index]['currentDateTime'] ?? 'no date & time',);
                      },
                    ),
                  completedList.isEmpty ?
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'No completed Task',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins-Bold',
                            fontSize: 25,
                            color: Color(0xFFD0D0D0)
                          ),
                        ),
                      )
                    ) : 
                    ListView.builder(
                      itemCount: completedList.length,
                      itemBuilder: (context, index) {
                        return CompletedBox(label: completedList[index]['title'] ?? 'No title', taskIndex: index,);
                      }
                    ),
                ]
              )
            ),
          ],
        ),
      ),
    );
  }
}
