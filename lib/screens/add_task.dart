import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/widgets/date_box.dart';
import 'package:todo/widgets/time_box.dart';
import 'package:todo/widgets/custom_filled_button.dart';
import 'package:todo/widgets/input_field.dart';
import 'package:todo/widgets/note_field.dart';
import 'package:todo/providers/providers.dart';
import 'package:todo/providers/time_provider.dart';
import 'package:todo/providers/date_provider.dart';
import 'package:todo/themes/time_theme.dart';
import 'package:todo/themes/date_theme.dart';
import 'package:intl/intl.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskNoteController = TextEditingController();
  late String formattedTime;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    formattedTime = DateFormat('hh:mm a').format(now);
    formattedDate = '${now.day}-${now.month}-${now.year}';
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: ref.read(selectedTimeProvider) ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: customTimePickerTheme(context),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      ref.read(selectedTimeProvider.notifier).state = pickedTime;
      setState(() {
        formattedTime = pickedTime.format(context);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: customDatePickerTheme(context),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      ref.read(selectedDateProvider.notifier).state = pickedDate;
      setState(() {
        formattedDate = '${pickedDate.day}-${pickedDate.month}-${pickedDate.year}';
      });
    }
  }

  @override
  void dispose() {
    taskNameController.dispose();
    taskNoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTime = ref.watch(selectedTimeProvider);
    final selectedDate = ref.watch(selectedDateProvider);

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFFFEFEFE),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Center(
              child: Text(
                "Add Task",
                style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 20,
                ),
              ),
            ),
            InputField(
              textHint: "Task name ...",
              controller: taskNameController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Expanded(
                  child: DateBox(
                    label: 'End date',
                    date: selectedDate != null
                        ? '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}'
                        : '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                    onPressed: () => _selectDate(context),
                  ),
                ),
                Expanded(
                  child: TimeBox(
                    label: 'End time',
                    time: selectedTime != null
                        ? selectedTime.format(context)
                        : TimeOfDay.now().format(context),
                    onPressed: () => _selectTime(context),
                  ),
                ),
              ],
            ),
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Note',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                ),
                NoteField(textHint: "Add note", controller: taskNoteController),
              ],
            ),
            Center(
              child: CustomFilledButton(
                buttontext: 'Add Task',
                onPressed: () {
                  final taskName = taskNameController.text.trim();
                  final taskNote = taskNoteController.text.trim();
                  final now = DateTime.now();
                  final String currentDateTime =
                      '${DateFormat('dd-MM-yyyy').format(now)} - ${DateFormat('hh:mm a').format(now)}';

                  final Map<String, String> taskDetails = {
                    'title': taskName,
                    'note': taskNote,
                    'currentDateTime': currentDateTime,
                    'date': selectedDate != null
                        ? '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}'
                        : '',
                    'time': selectedTime != null
                        ? selectedTime.format(context)
                        : '',
                  };

                  if (taskName.isNotEmpty &&
                      taskNote.isNotEmpty &&
                      taskDetails['date']!.isNotEmpty &&
                      taskDetails['time']!.isNotEmpty) {
                    ref.read(taskListProvider.notifier).addTask(taskDetails);
                    Navigator.of(context).pop();
                  } else {
                    null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}