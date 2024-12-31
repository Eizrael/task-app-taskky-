import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

class CompletedListNotifier extends StateNotifier<List<Map<String, String>>> {
  final Box<String> completedBox;

  CompletedListNotifier(this.completedBox)
      : super(completedBox.get('tasks') != null
            ? _deserialize(completedBox.get('tasks')!)
            : []) {
    // Load initial state from the box
    state = completedBox.get('tasks') != null
        ? _deserialize(completedBox.get('tasks')!)
        : [];
  }

  void addCompletedTask(Map<String, String> task) {
    state = [...state, task];
    _saveToHive();
  }

  void removeCompletedTask(int index) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..removeAt(index);
      _saveToHive();
    }
  }

  void _saveToHive() {
    completedBox.put('tasks', _serialize(state));
  }

  static String _serialize(List<Map<String, String>> tasks) {
    return jsonEncode(tasks);
  }

  static List<Map<String, String>> _deserialize(String tasksJson) {
    final List<dynamic> decoded = jsonDecode(tasksJson);
    return decoded.map<Map<String, String>>((item) {
      return item.map<String, String>((key, value) =>
          MapEntry(key as String, value as String)); // Explicit casting
    }).toList();
  }
}

final completedListProvider =
    StateNotifierProvider<CompletedListNotifier, List<Map<String, String>>>(
  (ref) {
    final completedBox = Hive.box<String>('completed_box');
    return CompletedListNotifier(completedBox);
  },
);
