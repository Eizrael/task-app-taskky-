import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

class TaskListNotifier extends StateNotifier<List<Map<String, String>>> {
  final Box<String> todoBox;

  TaskListNotifier(this.todoBox)
      : super(
            todoBox.get('tasks') != null ? _deserialize(todoBox.get('tasks')!) : []) {
    state = todoBox.get('tasks') != null ? _deserialize(todoBox.get('tasks')!) : [];
  }

  void addTask(Map<String, String> task) {
    state = [...state, task];
    _saveToHive();
  }

  void removeTask(int index) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..removeAt(index);
      _saveToHive();
    }
  }

  void _saveToHive() {
    todoBox.put('tasks', _serialize(state));
  }

  static String _serialize(List<Map<String, String>> tasks) {
    return jsonEncode(tasks);
  }

  static List<Map<String, String>> _deserialize(String tasksJson) {
    final List<dynamic> decoded = jsonDecode(tasksJson);
    return decoded.map<Map<String, String>>((item) {
      return item.map<String, String>((key, value) => MapEntry(key as String, value as String));
    }).toList();
  }
}

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Map<String, String>>>(
  (ref) {
    final todoBox = Hive.box<String>('todo_box');
    return TaskListNotifier(todoBox);
  },
);
